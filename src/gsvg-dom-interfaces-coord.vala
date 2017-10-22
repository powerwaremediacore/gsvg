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

  public abstract Matrix multiply(Matrix secondMatrix);
  public abstract Matrix inverse() throws GLib.Error;
  public abstract Matrix translate(double x, double y);
  public abstract Matrix scale(double scaleFactor);
  public abstract Matrix scaleNonUniform(double scaleFactorX, double scaleFactorY);
  public abstract Matrix rotate(double angle);
  public abstract Matrix rotateFromVector(double x, double y) throws GLib.Error;
  public abstract Matrix flipX();
  public abstract Matrix flipY();
  public abstract Matrix skewX(double angle);
  public abstract Matrix skewY(double angle);
}

public interface Transform : Object {
  public abstract int ttype { get; set; }
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
  public abstract short align { get; set; }
  public abstract short meetOrSlice { get; set; }

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
    XMAXYMAX = 10
  }

    // Meet-or-slice Types
  public enum MeetorSlice {
    UNKNOWN = 0,
    MEET = 1,
    SLICE = 2
  }
}

public interface AnimatedPreserveAspectRatio : Object {
  public abstract PreserveAspectRatio baseVal { get; }
  public abstract PreserveAspectRatio animVal { get; }
}

} // GSvg
