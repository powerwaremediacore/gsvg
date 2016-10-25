/* gsvg-dom-interfaces-painting.vala
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

public interface SVGPaint : Object, Object, SVGColor {

  public abstract unsigned short paintType { get; }
  public abstract string uri { get; }

  public abstract void setUri(string uri);
  public abstract void setPaint(ushort paintType,
                                string uri,
                                string rgbColor,
                                string iccColor) throws GLib.Error;

  /**
   * Paint Types
  */
  public enum Type {
    UNKNOWN = 0;
    RGBCOLOR = 1;
    RGBCOLOR_ICCCOLOR = 2;
    NONE = 101;
    CURRENTCOLOR = 102;
    URI_NONE = 103;
    URI_CURRENTCOLOR = 104;
    URI_RGBCOLOR = 105;
    URI_RGBCOLOR_ICCCOLOR = 106;
    URI = 107;
  }
}

public interface SVGMarkerElement : Object, Object,
                             SVGElement,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGFitToViewBox {

  public abstract  SVGAnimatedLength refX { get; }
  public abstract  SVGAnimatedLength refY { get;}
  public abstract  SVGAnimatedEnumeration markerUnits { get;}
  public abstract  SVGAnimatedLength markerWidth { get; }
  public abstract  SVGAnimatedLength markerHeight; { get; }
  public abstract  SVGAnimatedEnumeration orientType { get; }
  public abstract  SVGAnimatedAngle orientAngle { get; }

  public abstract void setOrientToAuto () raises(DOMException);
  public abstract void setOrientToAngle (SVGAngle angle) raises(DOMException);
}

  // Marker Unit Types
public enum SVGMarkerUnits {
  UNKNOWN = 0;
  USERSPACEONUSE = 1;
  STROKEWIDTH = 2;
}

  // Marker Orientation Types
public enum SVGMarkerOrient {
  UNKNOWN = 0;
  AUTO = 1;
  ANGLE = 2;
}

public interface SVGColorProfileElement : Object, SVGElement,
                                   SVGURIReference,
                                   SVGRenderingIntent {
  public abstract string local { get; set; }
  public abstract string name { get; set; }
  public abstract unsigned short renderingIntent { get; set; }
}

public interface SVGColorProfileRule : Object, SVGCSSRule,
                                SVGRenderingIntent {
  public abstract string src setraises(DOMException) { get; set; }
  public abstract string name setraises(DOMException) { get; set; }
  public abstract unsigned short renderingIntent setraises(DOMException) { get; set; }
}

public interface SVGGradientElement : Object, SVGElement,
                               SVGURIReference,
                               SVGExternalResourcesRequired,
                               SVGStylable,
                               SVGUnitTypes {
  public abstract  SVGAnimatedEnumeration gradientUnits { get; }
  public abstract  SVGAnimatedTransformList gradientTransform { get; }
  public abstract  SVGAnimatedEnumeration spreadMethod { get; }
}


  // Spread Method Types
public enum SVGSpreadMethod {
  UNKNOWN = 0;
  PAD = 1;
  REFLECT = 2;
  REPEAT = 3;
}

public interface SVGLinearGradientElement : Object, SVGGradientElement {
  public abstract  SVGAnimatedLength x1 { get; }
  public abstract  SVGAnimatedLength y1 { get; }
  public abstract  SVGAnimatedLength x2 { get; }
  public abstract  SVGAnimatedLength y2 { get; }
}

public interface SVGRadialGradientElement : Object, SVGGradientElement {
  public abstract  SVGAnimatedLength cx { get; }
  public abstract  SVGAnimatedLength cy { get; }
  public abstract  SVGAnimatedLength r { get; }
  public abstract  SVGAnimatedLength fx { get; }
  public abstract  SVGAnimatedLength fy { get; }
}

public interface SVGStopElement : Object, SVGElement,
                           SVGStylable {
  public abstract  SVGAnimatedNumber offset;
}

public interface SVGPatternElement : Object, SVGElement,
                              SVGURIReference,
                              SVGTests,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGStylable,
                              SVGFitToViewBox,
                              SVGUnitTypes {
  public abstract  SVGAnimatedEnumeration patternUnits { get; }
  public abstract  SVGAnimatedEnumeration patternContentUnits { get; }
  public abstract  SVGAnimatedTransformList patternTransform { get; }
  public abstract  SVGAnimatedLength x { get; }
  public abstract  SVGAnimatedLength y { get; }
  public abstract  SVGAnimatedLength width { get; }
  public abstract  SVGAnimatedLength height { get; }
}

public interface SVGClipPathElement : Object, SVGElement,
                               SVGTests,
                               SVGLangSpace,
                               SVGExternalResourcesRequired,
                               SVGStylable,
                               SVGTransformable,
                               SVGUnitTypes {
  public abstract  SVGAnimatedEnumeration clipPathUnits { get; }
}

public interface SVGMaskElement : Object, SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGUnitTypes {
  public abstract  SVGAnimatedEnumeration maskUnits { get; }
  public abstract  SVGAnimatedEnumeration maskContentUnits { get; }
  public abstract  SVGAnimatedLength x { get; }
  public abstract  SVGAnimatedLength y { get; }
  public abstract  SVGAnimatedLength width { get; }
  public abstract  SVGAnimatedLength height { get; }
}


