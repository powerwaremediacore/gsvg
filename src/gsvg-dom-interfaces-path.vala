/* gsvg-dom-interfaces-path.vala
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

public interface SVGPathSeg : Object {
  public abstract ushort pathSegType { get;}
  public abstract string pathSegTypeAsLetter { get;}

  /**
   * Path Segment Types
   */
  public enum Type {
    UNKNOWN = 0;
    CLOSEPATH = 1;
    MOVETO_ABS = 2;
    MOVETO_REL = 3;
    LINETO_ABS = 4;
    LINETO_REL = 5;
    CURVETO_CUBIC_ABS = 6;
    CURVETO_CUBIC_REL = 7;
    CURVETO_QUADRATIC_ABS = 8;
    CURVETO_QUADRATIC_REL = 9;
    ARC_ABS = 10;
    ARC_REL = 11;
    LINETO_HORIZONTAL_ABS = 12;
    LINETO_HORIZONTAL_REL = 13;
    LINETO_VERTICAL_ABS = 14;
    LINETO_VERTICAL_REL = 15;
    CURVETO_CUBIC_SMOOTH_ABS = 16;
    CURVETO_CUBIC_SMOOTH_REL = 17;
    CURVETO_QUADRATIC_SMOOTH_ABS = 18;
    CURVETO_QUADRATIC_SMOOTH_REL = 19;
  }
};

public interface SVGPathSegClosePath : Object SVGPathSeg {
};

public interface SVGPathSegMovetoAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
};

public interface SVGPathSegMovetoRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
};

public interface SVGPathSegLinetoAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
};

public interface SVGPathSegLinetoRel : Object SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
};

public interface SVGPathSegCurvetoCubicAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float x1 setraises(DOMException) { get; set; }
  public abstract float y1 setraises(DOMException) { get; set; }
  public abstract float x2 setraises(DOMException) { get; set; }
  public abstract float y2 setraises(DOMException) { get; set; }
};

public interface SVGPathSegCurvetoCubicRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float x1 setraises(DOMException) { get; set; }
  public abstract float y1 setraises(DOMException) { get; set; }
  public abstract float x2 setraises(DOMException) { get; set; }
  public abstract float y2 setraises(DOMException) { get; set; }
};

public interface SVGPathSegCurvetoQuadraticAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float x1 setraises(DOMException) { get; set; }
  public abstract float y1 setraises(DOMException) { get; set; }
};

public interface SVGPathSegCurvetoQuadraticRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float x1 setraises(DOMException) { get; set; }
  public abstract float y1 setraises(DOMException) { get; set; }
};

public interface SVGPathSegArcAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float r1 setraises(DOMException) { get; set; }
  public abstract float r2 setraises(DOMException) { get; set; }
  public abstract float angle setraises(DOMException) { get; set; }
  public abstract boolean largeArcFlag setraises(DOMxception) { get; set; }
  public abstract boolean sweepFlag setraises(DOMException) { get; set; }
};

public interface SVGPathSegArcRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float r1 setraises(DOMException) { get; set; }
  public abstract float r2 setraises(DOMException) { get; set; }
  public abstract float angle setraises(DOMException) { get; set; }
  public abstract boolean largeArcFlag setraises(DOMExcepton) { get; set; }
  public abstract boolean sweepFlag setraises(DOMException) { get; set; }
};

public interface SVGPathSegLinetoHorizontalAbs : Object, SVGPathSeg {
  float x setraises(DOMException) { get; set; }
}

public interface SVGPathSegLinetoHorizontalRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
}

public interface SVGPathSegLinetoVerticalAbs : Object, SVGPathSeg {
  public abstract float y setraises(DOMException) { get; set; }
}

public interface SVGPathSegLinetoVerticalRel : Object, SVGPathSeg {
  public abstract float y setraises(DOMException) { get; set; }
}

public interface SVGPathSegCurvetoCubicSmoothAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float x2 setraises(DOMException) { get; set; }
  public abstract float y2 setraises(DOMException) { get; set; }
}

public interface SVGPathSegCurvetoCubicSmoothRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
  public abstract float x2 setraises(DOMException) { get; set; }
  public abstract float y2 setraises(DOMException) { get; set; }
}

public interface SVGPathSegCurvetoQuadraticSmoothAbs : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
}

public interface SVGPathSegCurvetoQuadraticSmoothRel : Object, SVGPathSeg {
  public abstract float x setraises(DOMException) { get; set; }
  public abstract float y setraises(DOMException) { get; set; }
}

public interface SVGPathSegList : Object {

   ulong numberOfItems { get;}

  public abstract void clear() raises(DOMException);
  public abstract SVGPathSeg initialize(SVGPathSeg newItem) raises(DOMException);
  public abstract SVGPathSeg getItem(ulong index) raises(DOMException);
  public abstract SVGPathSeg insertItemBefore(SVGPathSeg newItem, ulong index) raises(DOMException);
  public abstract SVGPathSeg replaceItem(SVGPathSeg newItem, ulong index) raises(DOMException);
  public abstract SVGPathSeg removeItem(ulong index) raises(DOMException);
  public abstract SVGPathSeg appendItem(SVGPathSeg newItem) raises(DOMException);
}

public interface SVGAnimatedPathData : Object {
  public abstract  SVGPathSegList pathSegLis { get;}
  public abstract  SVGPathSegList normalizedPathSegList { get;}
  public abstract  SVGPathSegList animatedPathSegList { get;}
  public abstract  SVGPathSegList animatedNormalizedPathSegList { get;}
}

public interface SVGPathElement : Object, SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable,
                           SVGAnimatedPathData {

  public abstract SVGAnimatedNumber pathLength { get;}

  public abstract float getTotalLength();
  public abstract SVGPoint getPointAtLength(float distance);
  public abstract ulong getPathSegAtLength(float distance);
  public abstract SVGPathSegClosePath createSVGPathSegClosePath();
  public abstract SVGPathSegMovetoAbs createSVGPathSegMovetoAbs(float x, float y);
  public abstract SVGPathSegMovetoRel createSVGPathSegMovetoRel(float x, float y);
  public abstract SVGPathSegLinetoAbs createSVGPathSegLinetoAbs(float x, float y);
  public abstract SVGPathSegLinetoRel createSVGPathSegLinetoRel(float x, float y);
  public abstract SVGPathSegCurvetoCubicAbs createSVGPathSegCurvetoCubicAbs(float x, float y, float x1, float y1, float x2, float y2);
  public abstract SVGPathSegCurvetoCubicRel createSVGPathSegCurvetoCubicRel(float x, float y, float x1, float y1, float x2, float y2);
  public abstract SVGPathSegCurvetoQuadraticAbs createSVGPathSegCurvetoQuadraticAbs(float x, float y, float x1, float y1);
  public abstract SVGPathSegCurvetoQuadraticRel createSVGPathSegCurvetoQuadraticRel(float x, float y, float x1, float y1);
  public abstract SVGPathSegArcAbs createSVGPathSegArcAbs(float x, float y, float r1, float r2, float angle, boolean largeArcFlag, boolean sweepFlag);
  public abstract SVGPathSegArcRel createSVGPathSegArcRel(float x, float y, float r1, float r2, float angle, boolean largeArcFlag, boolean sweepFlag);
  public abstract SVGPathSegLinetoHorizontalAbs createSVGPathSegLinetoHorizontalAbs(float x);
  public abstract SVGPathSegLinetoHorizontalRel createSVGPathSegLinetoHorizontalRel(float x);
  public abstract SVGPathSegLinetoVerticalAbs createSVGPathSegLinetoVerticalAbs(float y);
  public abstract SVGPathSegLinetoVerticalRel createSVGPathSegLinetoVerticalRel(float y);
  public abstract SVGPathSegCurvetoCubicSmoothAbs createSVGPathSegCurvetoCubicSmoothAbs(float x, float y, float x2, float y2);
  public abstract SVGPathSegCurvetoCubicSmoothRel createSVGPathSegCurvetoCubicSmoothRel(float x, float y, float x2, float y2);
  public abstract SVGPathSegCurvetoQuadraticSmoothAbs createSVGPathSegCurvetoQuadraticSmoothAbs(float x, float y);
  public abstract SVGPathSegCurvetoQuadraticSmoothRel createSVGPathSegCurvetoQuadraticSmoothRel(float x, float y);
}


