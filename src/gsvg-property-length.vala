/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016, 2017 Daniel Espinosa <esodan@gmail.com>
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

public class GSvg.GsAnimatedLength : Object,
                                    GomProperty,
                                    AnimatedLength
{
  protected Length _base_val = new GsLength () as Length;
  protected Length _anim_val;
  // GomProperty
  /**
   * Attribute's value in the parent {@link DomElement}.
   */
  public string? value {
    owned get { return _base_val.value_as_string; }
    set {
      if (value != null)
        _base_val.value_as_string = value;
    }
  }
  public bool validate_value (string val) {
    return double.try_parse (val); // FIXME:
  }
  // baseVal
  public Length base_val {
    get { return _base_val; }
    construct set {
      if (value is GsLength)
        _base_val.value_as_string = (value as GsLength).to_string ();
    }
  }
  // animVal
  public Length anim_val {
    get {
      if (_anim_val == null)
         _anim_val = new GsLength () as Length;
      return _anim_val;
    }
  }
}

public class GSvg.GsLength : Object, GSvg.Length {
  Length.Type _unit_type = Length.Type.UNKNOWN;
  double _value_in_specified_units = (float) 0.0;
  string _value_as_string = "0";
  public Length.Type unit_type {
    get { return _unit_type; } construct set { _unit_type = value; }
  }
  public double value {
    get {
      return _value_in_specified_units;
    }
    set {
      _value_in_specified_units = value;
      _value_as_string = this.to_string ();
    }
  }
  public double value_in_specified_units {
    get {
      return _value_in_specified_units;
    }
    set {
      _value_in_specified_units = value;
      _value_as_string = this.to_string ();
    }
  }
  public string value_as_string {
    get {
      return _value_as_string;
    }
    set {
      _value_as_string = value;
      parse (_value_as_string);
    }
  }

  public void new_value_specified_units (Length.Type unit_type,
                                        double value_in_specified_units)
                                        throws GLib.Error {
    _unit_type = unit_type;
    this.value_in_specified_units = value_in_specified_units;
    this.value = this.value_in_specified_units;
    value_as_string = this.to_string ();
  }
  public void convert_to_specified_units (Length.Type unit_type) throws GLib.Error {
    GLib.warning ("No implemented");
  }
  public string to_string () {
    try {
      string units = Enumeration.get_string (typeof (Length.Type), _unit_type, true, true);
      if (_unit_type == Length.Type.UNKNOWN
          || _unit_type == Length.Type.NUMBER) units = "";
      if (_unit_type == Length.Type.PERCENTAGE) units = "%";
      string val = "%1.6g".printf (value_in_specified_units);
      return val+units;
    } catch { return ""; }
  }
  public void parse (string? v) {
    if (v == null) return;
    char* rs = null;
    double vd = 0.0;
    double.try_parse (v, out vd);
    _value_in_specified_units = vd;
    _unit_type = Length.Type.UNKNOWN;
    v.to_double (out rs);
    if (rs != null) {
      string rest = (string) rs;
      try {
        var ev = Enumeration.parse (typeof (Length.Type), rest);
        _unit_type = (Length.Type) ev.value;
      } catch { _unit_type = Length.Type.UNKNOWN; }
    }
    if (_value_as_string != v) {
      _value_as_string = this.to_string ();
    }
  }
}

public class GSvg.GsAnimatedLengthX : GSvg.GsAnimatedLength, AnimatedLengthX {
}

public class GSvg.GsAnimatedLengthY : GSvg.GsAnimatedLength, AnimatedLengthY {
}

public class GSvg.GsAnimatedLengthWidth : GSvg.GsAnimatedLength, AnimatedLengthWidth {
}
public class GSvg.GsAnimatedLengthHeight : GSvg.GsAnimatedLength, AnimatedLengthHeight {
}

public class GSvg.GsAnimatedLengthRX : GSvg.GsAnimatedLength, AnimatedLengthRX {
}

public class GSvg.GsAnimatedLengthRY : GSvg.GsAnimatedLength, AnimatedLengthRY {
}

public class GSvg.GsAnimatedLengthCX : GSvg.GsAnimatedLength, AnimatedLengthCX {
}

public class GSvg.GsAnimatedLengthCY : GSvg.GsAnimatedLength, AnimatedLengthCY {
}

public class GSvg.GsAnimatedLengthR : GSvg.GsAnimatedLength, AnimatedLengthR {
}

public class GSvg.GsLengthList : ArrayList<Length>,
                          LengthList
{
  private string separator = " ";
  public int number_of_items { get { return size; } }

  public void  clear () throws GLib.Error { clear (); }
  public Length initialize (Length new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public Length get_item (int index) throws GLib.Error {
    return get (index);
  }
  public Length insert_item_before (Length new_item, int index) throws GLib.Error {
    insert (index, new_item);
    return new_item;
  }
  public Length replace_item (Length new_item, int index) throws GLib.Error {
    remove_at (index);
    insert (index, new_item);
    return new_item;
  }
  public Length remove_item (int index) throws GLib.Error {
    return remove_at (index);
  }
  public Length append_item (Length new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public string? value {
    set {
      if (" " in value) separator = " ";
      if ("," in value) separator = ",";
      string[] tks = value.split (separator);
      for (int i = 0; i < tks.length; i++) {
        var p = new GsLength ();
        p.parse (tks[i]);
        add (p as Length);
      }
    }
    owned get {
      if (size == 0) return null;
      string str = "";
      for (int i = 0; i < size; i++) {
        var p = get (i);
        str += p.value_as_string;
        if (i+1 < size) str += separator;
      }
      return str;
    }
  }
}
public class GSvg.GsAnimatedLengthList : Object,
                                      GomProperty,
                                      AnimatedLengthList
{
  private LengthList _base_val;
  private LengthList _anim_val;
  // AnimatedLengthList
  public LengthList base_val {
    get {
      if (_base_val == null) _base_val = new GsLengthList ();
      return _base_val;
    }
  }
  public LengthList anim_val {
    get {
      if (_anim_val == null) _anim_val = new GsLengthList ();
      return _base_val;
    }
  }

  // GomProperty
  public string? value {
    owned get {
      if (_base_val == null) return null;
      return base_val.value;
    }
    set {
      if (_base_val == null) _base_val = new GsLengthList ();
      base_val.value = value;
    }
  }
  public bool validate_value (string val) {
    return "," in val || " " in val; // FIXME
  }
}
