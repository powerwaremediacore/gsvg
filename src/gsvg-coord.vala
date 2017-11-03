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

  public Point matrix_transform (Matrix matrix) { return new GsPoint (); }
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

  public new void clear () throws GLib.Error { (this as ArrayList).clear (); }
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
  private bool ey = false;
  public Transform.Type ttype { get; set; }
  public Matrix matrix { get; set; }
  public double angle { get; set; }

  public void set_translate (double tx, double ty) throws GLib.Error {
    ttype = Transform.Type.TRANSLATE;
    matrix = new GsMatrix ();
    matrix.a = 1;
    matrix.b = 0;
    matrix.c = 0;
    matrix.d = 1;
    matrix.e = tx;
    matrix.f = ty;
  }
  public void set_scale (double sx, double sy) throws GLib.Error {
    ttype = Transform.Type.SCALE;
    matrix = new GsMatrix ();
    matrix.a = sx;
    matrix.b = 0;
    matrix.c = 0;
    matrix.d = sy;
    matrix.e = 0;
    matrix.f = 0;
  }
  public void set_rotate (double angle, double cx, double cy) throws GLib.Error {
    ttype = Transform.Type.ROTATE;
    matrix = new GsMatrix ();
    this.angle = angle;
    matrix.a = Math.cos (angle);
    matrix.b = Math.sin (angle);
    matrix.c = -(Math.sin (angle));
    matrix.d = Math.cos (angle);
    // FIXME:
    matrix.e = cx;
    matrix.f = cy;
  }
  public void set_skew_x (double angle) throws GLib.Error {
    ttype = Transform.Type.SKEWX;
    matrix = new GsMatrix ();
    this.angle = angle;
    matrix.a = 1;
    matrix.b = 0;
    matrix.c = Math.tan (angle);
    matrix.d = 0;
    matrix.e = 0;
    matrix.f = 0;
  }
  public void set_skew_y (double angle) throws GLib.Error {
    ttype = Transform.Type.SKEWY;
    matrix = new GsMatrix ();
    this.angle = angle;
    matrix.a = 1;
    matrix.b = Math.tan (angle);
    matrix.c = 0;
    matrix.d = 1;
    matrix.e = 0;
    matrix.f = 0;
  }
  public void parse (string str) {
    if ("translate" in str) {
      if (!("(" in str)) return;
      if (!(")" in str)) return;
      string vals = str.down ().replace("translate","");
      vals = vals.replace ("(","");
      vals = vals.replace (")","");
      string x = vals;
      string y = "0";
      ey = false;
      if (" " in vals) {
        string[] astr = vals.split (" ");
        if (astr.length > 0)
          x = astr[0];
        if (astr.length > 1) {
          ey = true;
          y = astr[1];
        }
      }
      message ("x=%s, y=%s".printf (x, y));
      set_translate (double.parse (x), double.parse (y));
    }
    // FIXME: add all other types: matrix rotate skewx skewy
  }
  public string to_string () {
    string s = "";
    if (ttype == Transform.Type.TRANSLATE && matrix != null) {
      s += "translate(";
      s += "%0g".printf (matrix.e);
      if (ey) {
        s += " ";
        s += "%0g".printf (matrix.f);
      }
      s += ")";
    }
    message (s);
    return s;
  }
}

public class GSvg.GsTransformList : ArrayList<Transform>,
                                  GomProperty,
                                  TransformList
{

  static string KEYWORDS = "matrix translate scale rotate skewX skeyY";
  private string separator = " ";
  public int number_of_items { get { return size; } }

  public new void  clear () throws GLib.Error { (this as ArrayList).clear (); }
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
      if (value == null) {
        clear ();
        return;
      }
      parse (value);
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
  private void parse (string str) {
    clear ();
    message ("Parsing "+str);
    string kw = "";
    bool skip = false;
    int i = 0;
    unichar c;
    while (str.get_next_char (ref i, out c)) {
      message ("Current="+c.to_string ());
      kw = "";
      skip = false;
      while (c.to_string () != "(") {
        kw += c.to_string ();
        if (!str.get_next_char (ref i, out c)) return;
      }
      message (kw);
      if (!(kw.replace("(","") in KEYWORDS)) skip = true;
      kw += c.to_string();
      if (!str.get_next_char (ref i, out c)) return;
      while (c.to_string () != ")") {
        kw += c.to_string ();
        if (!str.get_next_char (ref i, out c)) return;
      }
      kw += c.to_string();
      message (kw);
      if (!skip) {
        var tr = new GsTransform ();
        tr.parse (kw);
        add (tr);
        message ("Added: "+kw+", Items: "+size.to_string ());
      }
      if (!str.get_next_char (ref i, out c)) return;
      while (c.to_string () == " ") {
        if (!str.get_next_char (ref i, out c)) return;
      }
      message ("Pos: "+i.to_string ()+" C: "+c.to_string ());
    }
    message ("Items: "+size.to_string ());
  }
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
