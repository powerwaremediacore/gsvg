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

  public abstract float x { get; set; }
  public abstract float y { get; set; }

  public abstract Point matrixTransform (Matrix matrix);
}

public interface PointList : Object {

  public abstract ulong numberOfItems { get; }

  public abstract void clear() throws GLib.Error;
  public abstract Point initialize(Point newItem) throws GLib.Error;
  public abstract Point getItem(ulong index) throws GLib.Error;
  public abstract Point insertItemBefore(Point newItem, ulong index) throws GLib.Error;
  public abstract Point replaceItem(Point newItem, ulong index) throws GLib.Error;
  public abstract Point removeItem(ulong index) throws GLib.Error;
  public abstract Point appendItem(Point newItem) throws GLib.Error;
}

public interface Matrix : Object {

  public abstract float a { get; set; }
  public abstract float b { get; set; }
  public abstract float c { get; set; }
  public abstract float d { get; set; }
  public abstract float e { get; set; }
  public abstract float f { get; set; }

  public abstract Matrix multiply(Matrix secondMatrix);
  public abstract Matrix inverse() throws GLib.Error;
  public abstract Matrix translate(float x, float y);
  public abstract Matrix scale(float scaleFactor);
  public abstract Matrix scaleNonUniform(float scaleFactorX, float scaleFactorY);
  public abstract Matrix rotate(float angle);
  public abstract Matrix rotateFromVector(float x, float y) throws GLib.Error;
  public abstract Matrix flipX();
  public abstract Matrix flipY();
  public abstract Matrix skewX(float angle);
  public abstract Matrix skewY(float angle);
}

public interface Transform {
  public abstract ushort type { get; set; }
  public abstract Matrix matrix { get; set; }
  public abstract float angle { get; set; }

  public abstract void setMatrix(Matrix matrix) throws GLib.Error;
  public abstract void setTranslate(float tx, float ty) throws GLib.Error;
  public abstract void setScale(float sx, float sy) throws GLib.Error;
  public abstract void setRotate(float angle, float cx, float cy) throws GLib.Error;
  public abstract void setSkewX(float angle) throws GLib.Error;
  public abstract void setSkewY(float angle) throws GLib.Error;


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

public interface TransformList : Object {

  public abstract ulong numberOfItems { get; }

  public abstract void clear()throws GLib.Error;
  public abstract Transform initialize(Transform newItem)throws GLib.Error;
  public abstract Transform getItem(ulong index)throws GLib.Error;
  public abstract Transform insertItemBefore(Transform newItem, ulong index) throws GLib.Error;
  public abstract Transform replaceItem(Transform newItem, ulong index) throws GLib.Error;
  public abstract Transform removeItem(ulong index)throws GLib.Error;
  public abstract Transform appendItem(Transform newItem)throws GLib.Error;
  public abstract Transform createSVGTransformFromMatrix(Matrix matrix);
  public abstract Transform consolidate() throws GLib.Error;
}

public interface AnimatedTransformList : Object {
  public abstract TransformList baseVal { get; set; }
  public abstract TransformList animVal { get; set; }
}

public interface PreserveAspectRatio {


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

public interface AnimatedPreserveAspectRatio {
  public abstract PreserveAspectRatio baseVal { get; }
  public abstract PreserveAspectRatio animVal { get; }
}

} // GSvg
