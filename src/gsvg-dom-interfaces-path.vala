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

namespace GSvg {

public interface PathSeg : Object {
  public abstract ushort pathSegType { get;}
  public abstract string pathSegTypeAsLetter { get;}

  /**
   * Path Segment Types
   */
  public enum Type {
    UNKNOWN = 0,
    CLOSEPATH = 1,
    MOVETO_ABS = 2,
    MOVETO_REL = 3,
    LINETO_ABS = 4,
    LINETO_REL = 5,
    CURVETO_CUBIC_ABS = 6,
    CURVETO_CUBIC_REL = 7,
    CURVETO_QUADRATIC_ABS = 8,
    CURVETO_QUADRATIC_REL = 9,
    ARC_ABS = 10,
    ARC_REL = 11,
    LINETO_HORIZONTAL_ABS = 12,
    LINETO_HORIZONTAL_REL = 13,
    LINETO_VERTICAL_ABS = 14,
    LINETO_VERTICAL_REL = 15,
    CURVETO_CUBIC_SMOOTH_ABS = 16,
    CURVETO_CUBIC_SMOOTH_REL = 17,
    CURVETO_QUADRATIC_SMOOTH_ABS = 18,
    CURVETO_QUADRATIC_SMOOTH_REL = 19
  }
}

public interface PathSegClosePath : Object, PathSeg {
}

public interface PathSegMovetoAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
}

public interface PathSegMovetoRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
}

public interface PathSegLinetoAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
}

public interface PathSegLinetoRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
}

public interface PathSegCurvetoCubicAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float x1 { get; set; }
  public abstract float y1 { get; set; }
  public abstract float x2 { get; set; }
  public abstract float y2 { get; set; }
}

public interface PathSegCurvetoCubicRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float x1 { get; set; }
  public abstract float y1 { get; set; }
  public abstract float x2 { get; set; }
  public abstract float y2 { get; set; }
}

public interface PathSegCurvetoQuadraticAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float x1 { get; set; }
  public abstract float y1 { get; set; }
}

public interface PathSegCurvetoQuadraticRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float x1 { get; set; }
  public abstract float y1 { get; set; }
}

public interface PathSegArcAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float r1 { get; set; }
  public abstract float r2 { get; set; }
  public abstract float angle { get; set; }
  public abstract bool largeArcFlag { get; set; }
  public abstract bool sweepFlag { get; set; }
}

public interface PathSegArcRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float r1 { get; set; }
  public abstract float r2 { get; set; }
  public abstract float angle { get; set; }
  public abstract bool largeArcFlag { get; set; }
  public abstract bool sweepFlag { get; set; }
}

public interface PathSegLinetoHorizontalAbs : Object, PathSeg {
  public abstract float x { get; set; }
}

public interface PathSegLinetoHorizontalRel : Object, PathSeg {
  public abstract float x { get; set; }
}

public interface PathSegLinetoVerticalAbs : Object, PathSeg {
  public abstract float y { get; set; }
}

public interface PathSegLinetoVerticalRel : Object, PathSeg {
  public abstract float y { get; set; }
}

public interface PathSegCurvetoCubicSmoothAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float x2 { get; set; }
  public abstract float y2 { get; set; }
}

public interface PathSegCurvetoCubicSmoothRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float x2 { get; set; }
  public abstract float y2 { get; set; }
}

public interface PathSegCurvetoQuadraticSmoothAbs : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
}

public interface PathSegCurvetoQuadraticSmoothRel : Object, PathSeg {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
}

public interface PathSegList : Object {

  public abstract ulong numberOfItems { get;}

  public abstract void clear() throws GLib.Error;
  public abstract PathSeg initialize(PathSeg newItem) throws GLib.Error;
  public abstract PathSeg getItem(ulong index) throws GLib.Error;
  public abstract PathSeg insertItemBefore(PathSeg newItem, ulong index) throws GLib.Error;
  public abstract PathSeg replaceItem(PathSeg newItem, ulong index) throws GLib.Error;
  public abstract PathSeg removeItem(ulong index) throws GLib.Error;
  public abstract PathSeg appendItem(PathSeg newItem) throws GLib.Error;
}

public interface AnimatedPathData : Object {
  public abstract  PathSegList pathSegLis { get;}
  public abstract  PathSegList normalizedPathSegList { get;}
  public abstract  PathSegList animatedPathSegList { get;}
  public abstract  PathSegList animatedNormalizedPathSegList { get;}
}

public interface PathElement : Object, Element,
                           Tests,
                           LangSpace,
                           ExternalResourcesRequired,
                           Stylable,
                           Transformable,
                           AnimatedPathData {

  public abstract AnimatedNumber pathLength { get;}

  public abstract float getTotalLength();
  public abstract Point getPointAtLength(float distance);
  public abstract ulong getPathSegAtLength(float distance);
  public abstract PathSegClosePath createSVGPathSegClosePath();
  public abstract PathSegMovetoAbs createSVGPathSegMovetoAbs(float x, float y);
  public abstract PathSegMovetoRel createSVGPathSegMovetoRel(float x, float y);
  public abstract PathSegLinetoAbs createSVGPathSegLinetoAbs(float x, float y);
  public abstract PathSegLinetoRel createSVGPathSegLinetoRel(float x, float y);
  public abstract PathSegCurvetoCubicAbs createSVGPathSegCurvetoCubicAbs(float x, float y, float x1, float y1, float x2, float y2);
  public abstract PathSegCurvetoCubicRel createSVGPathSegCurvetoCubicRel(float x, float y, float x1, float y1, float x2, float y2);
  public abstract PathSegCurvetoQuadraticAbs createSVGPathSegCurvetoQuadraticAbs(float x, float y, float x1, float y1);
  public abstract PathSegCurvetoQuadraticRel createSVGPathSegCurvetoQuadraticRel(float x, float y, float x1, float y1);
  public abstract PathSegArcAbs createSVGPathSegArcAbs(float x, float y, float r1, float r2, float angle, bool largeArcFlag, bool sweepFlag);
  public abstract PathSegArcRel createSVGPathSegArcRel(float x, float y, float r1, float r2, float angle, bool largeArcFlag, bool sweepFlag);
  public abstract PathSegLinetoHorizontalAbs createSVGPathSegLinetoHorizontalAbs(float x);
  public abstract PathSegLinetoHorizontalRel createSVGPathSegLinetoHorizontalRel(float x);
  public abstract PathSegLinetoVerticalAbs createSVGPathSegLinetoVerticalAbs(float y);
  public abstract PathSegLinetoVerticalRel createSVGPathSegLinetoVerticalRel(float y);
  public abstract PathSegCurvetoCubicSmoothAbs createSVGPathSegCurvetoCubicSmoothAbs(float x, float y, float x2, float y2);
  public abstract PathSegCurvetoCubicSmoothRel createSVGPathSegCurvetoCubicSmoothRel(float x, float y, float x2, float y2);
  public abstract PathSegCurvetoQuadraticSmoothAbs createSVGPathSegCurvetoQuadraticSmoothAbs(float x, float y);
  public abstract PathSegCurvetoQuadraticSmoothRel createSVGPathSegCurvetoQuadraticSmoothRel(float x, float y);
}

} // GSvg
