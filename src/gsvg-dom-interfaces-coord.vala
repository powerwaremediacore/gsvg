/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-interfaces-coord.vala
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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

namespace GSvg {

public interface Point : Object {

  public abstract double x { get; set; }
  public abstract double y { get; set; }

  public abstract Point matrix_transform (Matrix matrix);
  public abstract void parse (string str);
  public abstract string to_string ();
}

public interface PointList : Object, GomProperty {

  public abstract int   number_of_items { get; }

  public abstract void  clear() throws GLib.Error;
  public abstract Point initialize (Point newItem) throws GLib.Error;
  public abstract Point get_item (int index) throws GLib.Error;
  public abstract Point insert_item_before (Point newItem, int index) throws GLib.Error;
  public abstract Point replace_item (Point newItem, int index) throws GLib.Error;
  public abstract Point remove_item (int index) throws GLib.Error;
  public abstract Point append_item (Point newItem) throws GLib.Error;
}

public interface Matrix : Object {
  public abstract double a { get; set; }
  public abstract double b { get; set; }
  public abstract double c { get; set; }
  public abstract double d { get; set; }
  public abstract double e { get; set; }
  public abstract double f { get; set; }

  public abstract Matrix multiply (Matrix second_matrix);
  public abstract Matrix inverse () throws GLib.Error;
  public abstract Matrix translate (double x, double y);
  public abstract Matrix scale (double scale_factor);
  public abstract Matrix scale_non_uniform (double scale_factor_x, double scale_factor_y);
  public abstract Matrix rotate (double angle);
  public abstract Matrix rotate_from_vector (double x, double y) throws GLib.Error;
  public abstract Matrix flip_x ();
  public abstract Matrix flip_y ();
  public abstract Matrix skew_x (double angle);
  public abstract Matrix skew_y (double angle);
}

public interface Transform : Object {
  public abstract Type ttype { get; set; }
  public abstract Matrix matrix { get; set; }
  public abstract double angle { get; set; }

  public abstract void set_translate (double tx, double ty) throws GLib.Error;
  public abstract void set_scale (double sx, double sy) throws GLib.Error;
  public abstract void set_rotate (double angle, double cx, double cy) throws GLib.Error;
  public abstract void set_skew_x (double angle) throws GLib.Error;
  public abstract void set_skew_y (double angle) throws GLib.Error;

  public abstract string to_string ();


  // Transform Types
  public enum Type {
    UNKNOWN = 0,
    MATRIX = 1,
    TRANSLATE = 2,
    SCALE = 3,
    ROTATE = 4,
    SKEWX = 5,
    SKEWY = 6;
  }
}

public interface TransformList : Object, GomProperty {

  public abstract int number_of_items { get; }

  public abstract void clear()throws GLib.Error;
  public abstract Transform initialize (Transform newItem)throws GLib.Error;
  public abstract Transform get_item (int index)throws GLib.Error;
  public abstract Transform insert_item_before (Transform newItem, int index) throws GLib.Error;
  public abstract Transform replace_item (Transform newItem, int index) throws GLib.Error;
  public abstract Transform remove_item (int index)throws GLib.Error;
  public abstract Transform append_item (Transform newItem)throws GLib.Error;
  public abstract Transform create_svg_transform_from_matrix (Matrix matrix);
  public abstract Transform consolidate () throws GLib.Error;
}

public interface AnimatedTransformList : Object {
  public abstract TransformList base_val { get; set; }
  public abstract TransformList anim_val { get; set; }
}

public interface PreserveAspectRatio : Object {
  public abstract Type align { get; set; }
  public abstract MeetorSlice meet_or_slice { get; set; }

  // Alignment Types
  public enum Type {
    UNKNOWN = 0,
    NONE = 1,
    XMINYMIN = 2,
    XMIDYMIN = 3,
    XMAXYMIN = 4,
    XMINYMID = 5,
    XMIDYMID = 6,
    XMAXYMID = 7,
    XMINYMAX = 8,
    XMIDYMAX = 9,
    XMAXYMAX = 10;
    public static string? to_string (Type t) {
      string s = null;
      switch (t) {
        case UNKNOWN:
          break;
        case NONE:
          s = "none";
          break;
        case XMINYMIN:
          s = "xMinYMin";
          break;
        case XMIDYMIN:
          s = "xMidYMin";
          break;
        case XMAXYMIN:
          s = "xMaxYMin";
          break;
        case XMINYMID:
          s = "xMinYMid";
          break;
        case XMIDYMID:
          s = "xMidYMid";
          break;
        case XMAXYMID:
          s = "xMaxYMid";
          break;
        case XMINYMAX:
          s = "xMinYMax";
          break;
        case XMIDYMAX:
          s = "xMidYMax";
          break;
        case XMAXYMAX:
          s = "xMaxYMax";
          break;
      }
      return s;
    }
    public static Type parse (string? s) {
      if (s == null || s == "") return UNKNOWN;
      if (s.down () == "none".down ()) return NONE;
      if (s.down () == "xMinYMin".down ()) return XMINYMIN;
      if (s.down () == "xMidYMin".down ()) return XMIDYMIN;
      if (s.down () == "xMaxYMin".down ()) return XMAXYMIN;
      if (s.down () == "xMinYMid".down ()) return XMINYMID;
      if (s.down () == "xMidYMid".down ()) return XMIDYMID;
      if (s.down () == "xMaxYMid".down ()) return XMAXYMID;
      if (s.down () == "xMinYMax".down ()) return XMINYMAX;
      if (s.down () == "xMidYMax".down ()) return XMIDYMAX;
      if (s.down () == "xMaxYMax".down ()) return XMAXYMAX;
      return UNKNOWN;
    }
  }

    // Meet-or-slice Types
  public enum MeetorSlice {
    UNKNOWN = 0,
    MEET = 1,
    SLICE = 2;
    public static string? to_string (MeetorSlice m) {
      if (m == UNKNOWN) return null;
      string s = null;
      switch (m) {
        case UNKNOWN:
          break;
        case MEET:
          s = "meet";
          break;
        case SLICE:
          s = "slice";
          break;
      }
      return s;
    }
    public static MeetorSlice parse (string? str) {
      if (str == "" || str == null) return UNKNOWN;
      if (str.down () == "meet") return MEET;
      if (str.down () == "slice") return SLICE;
      return UNKNOWN;
    }
  }
}

public interface AnimatedPreserveAspectRatio : Object, GomProperty {
  public abstract PreserveAspectRatio base_val { get; set; }
  public abstract PreserveAspectRatio anim_val { get; set; }
}

} // GSvg
