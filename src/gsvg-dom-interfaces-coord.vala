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

public interface SVGPoint : Object {

  public abstract float x { get; set; }
  public abstract float y { get; set; }

  public abstract SVGPoint matrixTransform (SVGMatrix matrix);
}

public interface SVGPointList : Object {

  public abstract ulong numberOfItems { get; }

  public abstract void clear() throws GLib.Error;
  public abstract SVGPoint initialize(SVGPoint newItem) throws GLib.Error;
  public abstract SVGPoint getItem(ulong index) throws GLib.Error;
  public abstract SVGPoint insertItemBefore(SVGPoint newItem, ulong index) throws GLib.Error;
  public abstract SVGPoint replaceItem(SVGPoint newItem, ulong index) throws GLib.Error;
  public abstract SVGPoint removeItem(ulong index) throws GLib.Error;
  public abstract SVGPoint appendItem(SVGPoint newItem) throws GLib.Error;
}

public interface SVGMatrix : Object {

  public abstract float a { get; set; }
  public abstract float b { get; set; }
  public abstract float c { get; set; }
  public abstract float d { get; set; }
  public abstract float e { get; set; }
  public abstract float f { get; set; }

  public abstract SVGMatrix multiply(SVGMatrix secondMatrix);
  public abstract SVGMatrix inverse() throws GLib.Error;
  public abstract SVGMatrix translate(float x, float y);
  public abstract SVGMatrix scale(float scaleFactor);
  public abstract SVGMatrix scaleNonUniform(float scaleFactorX, float scaleFactorY);
  public abstract SVGMatrix rotate(float angle);
  public abstract VGMatrix rotateFromVector(float x, float y) throws GLib.Error;
  public abstract SVGMatrix flipX();
  public abstract SVGMatrix flipY();
  public abstract SVGMatrix skewX(float angle);
  public abstract SVGMatrix skewY(float angle);
}

public interface SVGTransform {
  public abstract ushort type { get; set; }
  public abstract SVGMatrix matrix { get; set; }
  public abstract float angle { get; set; }

  public abstract void setMatrix(SVGMatrix matrix) throws GLib.Error;
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

public interface SVGTransformList : Object {

  public abstract ulong numberOfItems { get; }

  public abstract void clear()throws GLib.Error;
  public abstract SVGTransform initialize(SVGTransform newItem)throws GLib.Error;
  public abstract SVGTransform getItem(ulong index)throws GLib.Error;
  public abstract SVGTransform insertItemBefore(SVGTransform newItem, ulong index) throws GLib.Error;
  public abstract SVGTransform replaceItem(SVGTransform newItem, ulong index) throws GLib.Error;
  public abstract SVGTransform removeItem(ulong index)throws GLib.Error;
  public abstract SVGTransform appendItem(SVGTransform newItem)throws GLib.Error;
  public abstract SVGTransform createSVGTransformFromMatrix(SVGMatrix matrix);
  public abstract SVGTransform consolidate() throws GLib.Error;
}

public interface SVGAnimatedTransformList : Object {
  public abstract SVGTransformList baseVal { get; set; }
  public abstract SVGTransformList animVal { get; set; }
}

interface SVGPreserveAspectRatio {


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

interface SVGAnimatedPreserveAspectRatio {
  public abstract SVGPreserveAspectRatio baseVal { get; }
  public abstract SVGPreserveAspectRatio animVal { get; }
}
