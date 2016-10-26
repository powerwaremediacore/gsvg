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

namespace GSvg {

public interface Paint : Object, Color {

  public abstract uint paintType { get; }
  public abstract string uri { get; }

  public abstract void setUri(string uri);
  public abstract void setPaint(uint paintType,
                                string uri,
                                string rgbColor,
                                string iccColor) throws GLib.Error;

  /**
   * Paint Types
  */
  public enum Type {
    UNKNOWN = 0,
    RGBCOLOR = 1,
    RGBCOLOR_ICCCOLOR = 2,
    NONE = 101,
    CURRENTCOLOR = 102,
    URI_NONE = 103,
    URI_CURRENTCOLOR = 104,
    URI_RGBCOLOR = 105,
    URI_RGBCOLOR_ICCCOLOR = 106,
    URI = 107
  }
}

public interface MarkerElement : Object,
                             Element,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable,
                             FitToViewBox {

  public abstract  AnimatedLength refX { get; }
  public abstract  AnimatedLength refY { get;}
  public abstract  AnimatedEnumeration markerUnits { get;}
  public abstract  AnimatedLength markerWidth { get; }
  public abstract  AnimatedLength markerHeight { get; }
  public abstract  AnimatedEnumeration orientType { get; }
  public abstract  AnimatedAngle orientAngle { get; }

  public abstract void setOrientToAuto () throws GLib.Error;
  public abstract void setOrientToAngle (Angle angle) throws GLib.Error;
}

  // Marker Unit Types
public enum MarkerUnits {
  UNKNOWN = 0,
  USERSPACEONUSE = 1,
  STROKEWIDTH = 2
}

  // Marker Orientation Types
public enum MarkerOrient {
  UNKNOWN = 0,
  AUTO = 1,
  ANGLE = 2
}

public interface ColorProfileElement : Object,
                                   Element,
                                   URIReference {
  public abstract string local { get; set; }
  public abstract string name { get; set; }
  public abstract uint renderingIntent { get; set; }
}

public interface ColorProfileRule : Object, CSSRule {
  public abstract string src { get; set; }
  public abstract string name { get; set; }
  public abstract uint renderingIntent { get; set; }
}

public interface GradientElement : Object,
                               Element,
                               URIReference,
                               ExternalResourcesRequired,
                               Stylable {
  public abstract  AnimatedEnumeration gradientUnits { get; }
  public abstract  AnimatedTransformList gradientTransform { get; }
  public abstract  AnimatedEnumeration spreadMethod { get; }
}


  // Spread Method Types
public enum SpreadMethod {
  UNKNOWN = 0,
  PAD = 1,
  REFLECT = 2,
  REPEAT = 3
}

public interface LinearGradientElement : Object, GradientElement {
  public abstract  AnimatedLength x1 { get; }
  public abstract  AnimatedLength y1 { get; }
  public abstract  AnimatedLength x2 { get; }
  public abstract  AnimatedLength y2 { get; }
}

public interface RadialGradientElement : Object, GradientElement {
  public abstract  AnimatedLength cx { get; }
  public abstract  AnimatedLength cy { get; }
  public abstract  AnimatedLength r { get; }
  public abstract  AnimatedLength fx { get; }
  public abstract  AnimatedLength fy { get; }
}

public interface StopElement : Object,
                           Element,
                           Stylable {
  public abstract  AnimatedNumber offset { get; }
}

public interface PatternElement : Object,
                              Element,
                              URIReference,
                              Tests,
                              LangSpace,
                              ExternalResourcesRequired,
                              Stylable,
                              FitToViewBox {
  public abstract  AnimatedEnumeration patternUnits { get; }
  public abstract  AnimatedEnumeration patternContentUnits { get; }
  public abstract  AnimatedTransformList patternTransform { get; }
  public abstract  AnimatedLength x { get; }
  public abstract  AnimatedLength y { get; }
  public abstract  AnimatedLength width { get; }
  public abstract  AnimatedLength height { get; }
}

public interface ClipPathElement : Object,
                               Element,
                               Tests,
                               LangSpace,
                               ExternalResourcesRequired,
                               Stylable,
                               Transformable {
  public abstract  AnimatedEnumeration clipPathUnits { get; }
}

public interface MaskElement : Object,
                           Element,
                           Tests,
                           LangSpace,
                           ExternalResourcesRequired,
                           Stylable {
  public abstract  AnimatedEnumeration maskUnits { get; }
  public abstract  AnimatedEnumeration maskContentUnits { get; }
  public abstract  AnimatedLength x { get; }
  public abstract  AnimatedLength y { get; }
  public abstract  AnimatedLength width { get; }
  public abstract  AnimatedLength height { get; }
}

} // GSvg
