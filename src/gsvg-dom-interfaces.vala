/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016 Daniel Espinosa
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
/**
 * Top level SVG Element node according with https://www.w3.org/TR/SVG/ version 1.1
 */
public interface Element : Object, DomElement {
  public abstract string id { get; set; }
  public abstract string xmlbase { get; set; }
  public abstract SVGElement ownerSVGElement { get; }
  public abstract Element viewportElement { get; }
}

public interface AnimatedBoolean : Object {
  public abstract bool baseVal { get; set; }
  public abstract bool animVal { get; }
}

public interface AnimatedString : Object {
  public abstract string baseVal { get; set; }
  public abstract string animVal { get; }
}

public interface StringList : Object {

  public abstract uint numberOfItems { get; }
  public abstract void clear () throws GLib.Error;
  public abstract string initialize (string newItem) throws GLib.Error;
  public abstract string getItem (int index) throws GLib.Error;
  public abstract string insertItemBefore (string newItem, uint index) throws GLib.Error;
  public abstract string replaceItem (string newItem, uint index) throws GLib.Error;
  public abstract string removeItem (int index) throws GLib.Error;
  public abstract string appendItem (string newItem) throws GLib.Error;
}


public interface AnimatedEnumeration : Object {
  public abstract uint baseVal { get; set; }
  public abstract uint animVal { get; }
}

public interface AnimatedInteger : Object {
  public abstract long baseVal { get; set; }
  public abstract long animVal { get; }
}

public interface Number : Object {
  public abstract float value { get; set; }
}

public interface AnimatedNumber : Object {
  public abstract float baseVal { get; set; }
  public abstract float animVal  { get; }
}

public interface NumberList : Object {

  public abstract uint numberOfItems { get; }

  public abstract void clear() throws GLib.Error;
  public abstract Number initialize(Number newItem) throws GLib.Error;
  public abstract Number getItem(uint index) throws GLib.Error;
  public abstract Number insertItemBefore(Number newItem, uint index) throws GLib.Error;
  public abstract Number replaceItem(Number newItem, uint index) throws GLib.Error;
  public abstract Number removeItem(uint index) throws GLib.Error;
  public abstract Number appendItem(Number newItem) throws GLib.Error;
}

public interface AnimatedNumberList : Object {
  public abstract NumberList baseVal { get; }
  public abstract NumberList animVal { get; }
}

public interface Length : Object {
  public abstract uint unitType { get; }
  public abstract float value { get; set; }
  public abstract float valueInSpecifiedUnits { get; set; }
  public abstract string valueAsString { get; set; }

  public abstract void newValueSpecifiedUnits(uint unitType,float valueInSpecifiedUnits) throws GLib.Error;
  public abstract void convertToSpecifiedUnits(uint unitType) throws GLib.Error;

  /**
   * Length Unit Types
   */
  public enum Type {
    UNKNOWN = 0,
    NUMBER = 1,
    PERCENTAGE = 2,
    EMS = 3,
    EXS = 4,
    PX = 5,
    CM = 6,
    MM = 7,
    IN = 8,
    PT = 9,
    PC = 10
  }
}

public interface AnimatedLength : Object {
  public abstract Length baseVal { get; }
  public abstract Length animVal { get; }
}

public interface LengthList : Object {

  public abstract uint numberOfItems { get; }

  public abstract void clear() throws GLib.Error;
  public abstract Length initialize(Length newItem) throws GLib.Error;
  public abstract Length getItem(uint index) throws GLib.Error;
  public abstract Length insertItemBefore(Length newItem,uint index) throws GLib.Error;
  public abstract Length replaceItem(Length newItem, uint index) throws GLib.Error;
  public abstract Length removeItem(uint index) throws GLib.Error;
  public abstract Length appendItem(Length newItem) throws GLib.Error;
}

public interface AnimatedLengthList : Object {
  public abstract LengthList baseVal { get; }
  public abstract LengthList animVal { get; }
}

public interface Angle : Object {
  public abstract uint unitType { get; }
  public abstract  float value { get; set; }
  public abstract  float valueInSpecifiedUnits { get; set; }
  public abstract  string valueAsString { get; set; }

  public abstract void newValueSpecifiedUnits (uint unitType, float valueInSpecifiedUnits) throws GLib.Error;
  public abstract void convertToSpecifiedUnits (uint unitType) throws GLib.Error;
  /**
   * Angle Unit Types
   */
  public enum  Type {
    UNKNOWN = 0,
    UNSPECIFIED = 1,
    DEG = 2,
    RAD = 3,
    GRAD = 4;
  }
}

public interface AnimatedAngle : Object {
  public abstract  Angle baseVal { get; }
  public abstract  Angle animVal { get; }
}

public interface Color : Object, CSSValue {
  public abstract uint colorType { get; }
  public abstract CSSRGBColor rgbColor { get; }
  public abstract ICCColor iccColor { get; }

  public abstract void setRGBColor(string rgbColor) throws GLib.Error;
  public abstract void setRGBColorICCColor(string rgbColor, string iccColor) throws GLib.Error;
  public abstract void setColor(uint colorType, string rgbColor, string iccColor) throws GLib.Error;

  /**
   * Color Types
   */
  public enum Type {
    NKNOWN = 0,
    RGBCOLOR = 1,
    RGBCOLOR_ICCCOLOR = 2,
    CURRENTCOLOR = 3
  }
}

public interface ICCColor : Object {
  public abstract string colorProfile { get; set; }
  public abstract NumberList colors { get; }
}

public interface Rect : Object {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float width { get; set; }
  public abstract float height { get; set; }
}

public interface AnimatedRect : Object {
  public abstract Rect baseVal { get; }
  public abstract Rect animVal { get; }
}

/**
 * Unit Types
 */
public enum UnitTypes {
  UNKNOWN = 0,
  USERSPACEONUSE = 1,
  OBJECTBOUNDINGBOX = 2
}

public interface Stylable : Object {

  public abstract  AnimatedString className { get; }
  public abstract  CSSStyleDeclaration style { get; }

  public abstract CSSValue getPresentationAttribute (string name);
}

public interface Locatable : Object {

  public abstract Element nearestViewportElement { get; }
  public abstract Element farthestViewportElement { get; }

  public abstract Rect getBBox();
  public abstract Matrix getCTM();
  public abstract Matrix getScreenCTM();
  public abstract Matrix getTransformToElement(Element element) throws GLib.Error;
}

public interface Transformable : Object, Locatable {
  public abstract AnimatedTransformList transform { get; }
}

public interface Tests : Object {

  public abstract StringList requiredFeatures { get; }
  public abstract StringList requiredExtensions { get; }
  public abstract StringList systemLanguage { get; }

  public abstract bool hasExtension (string extension);
}

public interface LangSpace : Object {
  public abstract string xmllang { get; set; }
  public abstract string xmlspace { get; set; }
}

public interface ExternalResourcesRequired : Object {
  public abstract AnimatedBoolean externalResourcesRequired { get; }
}

public interface FitToViewBox : Object {
  public abstract AnimatedRect viewBox { get; }
  public abstract AnimatedPreserveAspectRatio preserveAspectRatio { get; }
}

public interface ZoomAndPan : Object {
  public abstract short zoomAndPan { get; set; }

  /**
   * Zoom and Pan Types
   */
  public enum Type {
    UNKNOWN = 0,
    DISABLE = 1,
    MAGNIFY = 2
  }
}

public interface ViewSpec : Object,
                            ZoomAndPan,
                            FitToViewBox {
  public abstract TransformList transform { get; }
  public abstract Element viewTarget { get; }
  public abstract string viewBoxString { get; }
  public abstract string preserveAspectRatioString { get; }
  public abstract string transformString { get; }
  public abstract string viewTargetString { get; }
}

public interface URIReference : Object {
  public abstract AnimatedString href { get; }
}

public interface SVGCSSRule : Object, CSSRule {
  public enum Type {
    COLOR_PROFILE_RULE = 7
  }
}
/**
 * Rendering Intent Types
 */
public enum RenderingIntent {
  UNKNOWN = 0,
  INTENT_AUTO = 1,
  PERCEPTUAL = 2,
  COLORIMETRIC = 3,
  SATURATION = 4,
  ABSOLUTE_COLORIMETRIC = 5
}

}// GSvg
