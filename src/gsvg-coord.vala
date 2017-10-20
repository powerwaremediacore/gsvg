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

public class GSvg.GsPoint : Object, Point {
  public double x { get; set; }
  public double y { get; set; }

  public Point matrix_transform (Matrix matrix) { return null; }
  public void parse (string str) {
    string[] p = str.split (",");
    if (p.length == 0) return;
    x = double.parse (p[0]);
    if (p.length > 1)
    y = double.parse (p[1]);
  }
  public string to_string () {
    return "%0.0g".printf (x)+","+"%0.0g".printf (y);
  }
}

public class GSvg.GsPointList : ArrayList<Point>,
                                    GomProperty,
                                    PointList
{
  public int number_of_items { get { return size; } }

  public void  clear () throws GLib.Error { clear (); }
  public Point initialize (Point new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public Point get_item (int index) throws GLib.Error {
    return get (index);
  }
  public Point insert_item_before (Point new_item, int index) throws GLib.Error {
    insert (index, new_item);
    return new_item;
  }
  public Point replace_item (Point new_item, int index) throws GLib.Error {
    remove_at (index);
    insert (index, new_item);
    return new_item;
  }
  public Point remove_item (int index) throws GLib.Error {
    return remove_at (index);
  }
  public Point append_item (Point new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public string? value {
    set {
      string[] tks = value.split (" ");
      for (int i = 0; i < tks.length; i++) {
        var p = new GsPoint ();
        p.parse (tks[i]);
        add (p as Point);
      }
    }
    owned get {
      if (size == 0) return null;
      string str = "";
      for (int i = 0; i < size; i++) {
        var p = get (i);
        str += p.to_string ();
        if (i+1 < size) str += " ";
      }
      return str;
    }
  }
  public bool validate_value (string val) {
    return "," in val; // FIXME
  }
}
