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
    return "%0g".printf (x)+","+"%0g".printf (y);
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

public class GSvg.GsTransform : Object, Transform {
  public int ttype { get; set; }
  public Matrix matrix { get; set; }
  public double angle { get; set; }

  public void set_translate (double tx, double ty) throws GLib.Error {}
  public void set_scale (double sx, double sy) throws GLib.Error {}
  public void set_rotate (double angle, double cx, double cy) throws GLib.Error {}
  public void set_skew_x (double angle) throws GLib.Error {}
  public void set_skew_y (double angle) throws GLib.Error {}
  public void parse (string str) {
    // FIXME
  }
  public string to_string () {
    return "";
  }
}

public class GSvg.GsTransformList : ArrayList<Transform>,
                                  GomProperty,
                                  TransformList
{
  private string separator = " ";
  public int number_of_items { get { return size; } }

  public void  clear () throws GLib.Error { clear (); }
  public Transform initialize (Transform new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public Transform get_item (int index) throws GLib.Error {
    return get (index);
  }
  public Transform insert_item_before (Transform new_item, int index) throws GLib.Error {
    insert (index, new_item);
    return new_item;
  }
  public Transform replace_item (Transform new_item, int index) throws GLib.Error {
    remove_at (index);
    insert (index, new_item);
    return new_item;
  }
  public Transform remove_item (int index) throws GLib.Error {
    return remove_at (index);
  }
  public Transform append_item (Transform new_item) throws GLib.Error {
    add (new_item);
    return new_item;
  }
  public string? value {
    set {
      if (" " in value) separator = " ";
      if ("," in value) separator = ",";
      string[] tks = value.split (separator);
      for (int i = 0; i < tks.length; i++) {
        var p = new GsTransform ();
        p.parse (tks[i]);
        add (p as Transform);
      }
    }
    owned get {
      if (size == 0) return null;
      string str = "";
      for (int i = 0; i < size; i++) {
        var p = get (i);
        str += p.to_string ();
        if (i+1 < size) str += separator;
      }
      return str;
    }
  }
  public bool validate_value (string val) {
    return "," in val || " " in val; // FIXME
  }
  public Transform create_svg_transform_from_matrix (Matrix matrix) { return new GsTransform (); }
  public Transform consolidate () throws GLib.Error { return new GsTransform (); }
}

public class GSvg.GsAnimatedTransformList : Object,
                                          GomProperty
{
  public TransformList base_val { get; set; }
  public TransformList anim_val { get; set; }
  public string? value {
    owned get {
      if (base_val == null) return null;
      return base_val.value;
    }
    set {
      if (base_val == null)
        base_val = new GsTransformList ();
      base_val.value = value;
    }
  }
  public bool validate_value (string val) {
    if (base_val == null) base_val = new GsTransformList ();
    return base_val.validate_value (val);
  }
}

public class GSvg.GsAngle : Object, Angle {
  public Angle.Type unit_type { get; set; }
  public double value { get; set; }
  public double value_in_specified_units { get; set; }
  public string value_as_string { get; set; }

  public void new_value_specified_units (Angle.Type unit_type, double value_in_specified_units) throws GLib.Error {}
  public void convert_to_specified_units (Angle.Type unit_type) throws GLib.Error {}
}
public class GSvg.GsMatrix : Object, Matrix {
  public double a { get; set; }
  public double b { get; set; }
  public double c { get; set; }
  public double d { get; set; }
  public double e { get; set; }
  public double f { get; set; }

  public Matrix multiply (Matrix second_matrix) { return new GsMatrix (); }
  public Matrix inverse () throws GLib.Error { return new GsMatrix (); }
  public Matrix translate (double x, double y) { return new GsMatrix (); }
  public Matrix scale (double scaleFactor) { return new GsMatrix (); }
  public Matrix scale_non_uniform (double scaleFactorX, double scaleFactorY) { return new GsMatrix (); }
  public Matrix rotate (double angle) { return new GsMatrix (); }
  public Matrix rotate_from_vector (double x, double y) throws GLib.Error { return new GsMatrix (); }
  public Matrix flip_x () { return new GsMatrix (); }
  public Matrix flip_y () { return new GsMatrix (); }
  public Matrix skew_x (double angle) { return new GsMatrix (); }
  public Matrix skew_y (double angle) { return new GsMatrix (); }
}
