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

  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }

  public abstract SVGPoint matrixTransform (SVGMatrix matrix);
}

public interface SVGPointList : Object {

  public abstract ulong numberOfItems { get; set; }

  public abstract void clear() raises(DOMException);
  public abstract SVGPoint initialize(SVGPoint newItem) raises(DOMException) { get; set; }
  public abstract SVGPoint getItem(unsigned long index) raises(DOMException) { get; set; }
  public abstract SVGPoint insertItemBefore(SVGPoint newItem, unsigned long index) raises(DOMException) { get; set; }
  public abstract SVGPoint replaceItem(SVGPoint newItem, unsigned long index) raises(DOMException) { get; set; }
  public abstract SVGPoint removeItem(unsigned long index) raises(DOMException) { get; set; }
  public abstract SVGPoint appendItem(SVGPoint newItem) raises(DOMException) { get; set; }
}

public interface SVGMatrix : Object {

  public abstract float a setraises(DOMException) { get; set; }
  public abstract float b setraises(DOMException) { get; set; }
  public abstract float c setraises(DOMException) { get; set; }
  public abstract float d setraises(DOMException) { get; set; }
  public abstract float e setraises(DOMException) { get; set; }
  public abstract float f setraises(DOMException) { get; set; }

  public abstract SVGMatrix multiply(SVGMatrix secondMatrix);
  public abstract SVGMatrix inverse() raises(SVGException);
  public abstract SVGMatrix translate(float x, float y);
  public abstract SVGMatrix scale(float scaleFactor);
  public abstract SVGMatrix scaleNonUniform(float scaleFactorX, float scaleFactorY);
  public abstract SVGMatrix rotate(float angle);
  public abstract VGMatrix rotateFromVector(float x, float y) raises(SVGException);
  public abstract SVGMatrix flipX();
  public abstract SVGMatrix flipY();
  public abstract SVGMatrix skewX(float angle);
  public abstract SVGMatrix skewY(float angle);
}

public interface SVGTransform {
  public abstract ushort type { get; set; }
  public abstract SVGMatrix matrix { get; set; }
  public abstract float angle { get; set; }

  public abstract void setMatrix(SVGMatrix matrix) raises(DOMException);
  public abstract void setTranslate(float tx, float ty) raises(DOMException);
  public abstract void setScale(float sx, float sy) raises(DOMException);
  public abstract void setRotate(float angle, float cx, float cy) raises(DOMException);
  public abstract void setSkewX(float angle) raises(DOMException);
  public abstract void setSkewY(float angle) raises(DOMException);


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

  public abstract ulong numberOfItems;

  public abstract void clear()throws GLib.Error;
  public abstract SVGTransform initialize(SVGTransform newItem)throws GLib.Error;
  public abstract SVGTransform getItem(unsigned long index)throws GLib.Error;
  public abstract SVGTransform insertItemBefore(SVGTransform newItem, ulong index) raises(DOMException);
  public abstract SVGTransform replaceItem(SVGTransform newItem, ulong index) raises(DOMException);
  public abstract SVGTransform removeItem(unsigned long index)throws GLib.Error;
  public abstract SVGTransform appendItem(SVGTransform newItem)throws GLib.Error;
  public abstract SVGTransform createSVGTransformFromMatrix(SVGMatrix matrix);
  public abstract SVGTransform consolidate() raises(DOMException);
}

public interface SVGAnimatedTransformList : Object {
  public abstract SVGTransformList baseVal { get; set; }
  public abstract SVGTransformList animVal { get; set; }
}

interface SVGPreserveAspectRatio {


  public abstract short align setraises(DOMException) { get; set; }
  public abstract short meetOrSlice setraises(DOMException) { get; set; }


  // Alignment Types
  public enum Type {
    UNKNOWN = 0;
    NONE = 1;
    XMINYMIN = 2;
    XMIDYMIN = 3;
    XMAXYMIN = 4;
    XMINYMID = 5;
    XMIDYMID = 6;
    XMAXYMID = 7;
    XMINYMAX = 8;
    XMIDYMAX = 9;
    XMAXYMAX = 10;
  }

    // Meet-or-slice Types
  public enum MeetorSlice {
    UNKNOWN = 0;
    MEET = 1;
    SLICE = 2;
  }
}

interface SVGAnimatedPreserveAspectRatio {
  public abstract SVGPreserveAspectRatio baseVal { get; }
  public abstract SVGPreserveAspectRatio animVal { get; }
}
