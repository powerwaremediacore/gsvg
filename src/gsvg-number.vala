/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* css-classes.vala
 *
 * Copyright (C) 2017 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using GLib;
using GXml;
using Gee;

public class GSvg.GsNumber : Object, Number {
  public double value { get; set; }
}

public class GSvg.GsAnimatedNumber : Object, AnimatedNumber {
  public double base_val { get; set; }
  public double anim_val  { get; set; }
}

public class GSvg.GsNumberList : ArrayList<Number>,
                          NumberList
{
  private string separator = " ";
  public int number_of_items { get { return size; } }

  public void  clear () throws GLib.Error { clear (); }
  public Number initialize (Number new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public Number get_item (int index) throws GLib.Error {
    return get (index);
  }
  public Number insert_item_before (Number new_item, int index) throws GLib.Error {
    insert (index, new_item);
    return new_item;
  }
  public Number replace_item (Number new_item, int index) throws GLib.Error {
    remove_at (index);
    insert (index, new_item);
    return new_item;
  }
  public Number remove_item (int index) throws GLib.Error {
    return remove_at (index);
  }
  public Number append_item (Number new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public string? value {
    set {
      if (" " in value) separator = " ";
      if ("," in value) separator = ",";
      string[] tks = value.split (separator);
      for (int i = 0; i < tks.length; i++) {
        var p = new GsNumber ();
        p.value.parse (tks[i]);
        add (p as Number);
      }
    }
    owned get {
      if (size == 0) return null;
      string str = "";
      for (int i = 0; i < size; i++) {
        var p = get (i);
        str += "%0.0g".printf (p.value);
        if (i+1 < size) str += separator;
      }
      return str;
    }
  }
}

public class GSvg.GsAnimatedNumberList : Object,
                                GomProperty,
                                AnimatedNumberList
{
  private NumberList _base_val;
  private NumberList _anim_val;
  public NumberList base_val {
    get {
      if (_base_val == null) _base_val = new GsNumberList ();
      return _base_val;
    }
    set { _base_val = value; }
  }
  public NumberList anim_val {
    get {
      if (_anim_val == null) _anim_val = new GsNumberList ();
      return _anim_val;
    }
    set { _anim_val = value; }
  }
  // GomProperty
  public string? value {
    owned get {
      if (_base_val == null) return null;
      return base_val.value;
    }
    set {
      if (_base_val == null) _base_val = new GsNumberList ();
      base_val.value = value;
    }
  }
  public bool validate_value (string val) {
    return "," in val || " " in val; // FIXME
  }
}
