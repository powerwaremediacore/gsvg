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

/**
 * Top level SVG Element node according with https://www.w3.org/TR/SVG/ version 1.1
 */
public interface GSvg.SVGElement : Object, DomElement {
  public abstract string id { get; set; }
  public abstract string xmlbase { get; set; }
  public abstract SVGSVGElement ownerSVGElement { get; }
  public abstract SVGElement viewportElement { get; }
}

public interface GSvg.SVGAnimatedBoolean Object, {
  public abstract bool baseVal { get; set; }
  public abstract bool animVal { get; }
}

public interface GSvg.SVGAnimatedString : Object {
  public abstract string baseVal { get; set; }
  public abstract string animVal { get; }
}

public interface GSvg.SVGStringList : Object {

  public abstract uint numberOfItems { get; }
  public abstract void clear () throws GLib.Error;
  public abstract string initialize (string newItem) throws GLib.Error;
  public abstract string getItem (int index) throws GLib.Error;
  public abstract string insertItemBefore (string newItem, unsigned long index) throws GLib.Error;
  public abstract string replaceItem (string newItem, unsigned long index) throws GLib.Error;
  public abstract string removeItem (int index) throws GLib.Error;
  public abstract string appendItem (string newItem) throws GLib.Error;
}


public interface GSvg.SVGAnimatedEnumeration : Object {
  public abstract uint baseVal { get; set; }
  public abstract uint animVal { get; }
}

public interface GSvg.SVGAnimatedInteger : Object {
  public abstract long baseVal { get; set; }
  public abstract long animVal { get; }
}

public interface GSvg.SVGNumber : Object {
  public abstract float value { get; set; }
}

public interface GSvg.SVGAnimatedNumber : Object {
  public abstract float baseVal { get; set; }
  public abstract float animVal  { get; }
}

public interface GSvg.SVGNumberList : Object {

  public abstract ulong numberOfItems { get; }

  public abstract void clear() { get; }
  public abstract SVGNumber initialize(SVGNumber newItem) throws GLib.Error;
  public abstract SVGNumber getItem(ulong index) throws GLib.Error;
  public abstract SVGNumber insertItemBefore(SVGNumber newItem, unsigned long index) throws GLib.Error;
  public abstract SVGNumber replaceItem(SVGNumber newItem, unsigned long index) throws GLib.Error;
  public abstract SVGNumber removeItem(ulong index) throws GLib.Error;
  public abstract SVGNumber appendItem(SVGNumber newItem) throws GLib.Error;
}

public interface GSvg.SVGAnimatedNumberList : Object {
  public abstract SVGNumberList baseVal { get; }
  public abstract SVGNumberList animVal { get; }
}

public interface SVGLength : Object {
  public abstract ushort unitType { get; }
  public abstract float value { get; set; }
  public abstract float valueInSpecifiedUnits { get; set; }
  public abstract string valueAsString { get; set; }

  public abstract void newValueSpecifiedUnits(ushort unitType,float valueInSpecifiedUnits) throws GLib.Error;
  public abstract void convertToSpecifiedUnits(ushort unitType) throws GLib.Error;

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

public interface SVGAnimatedLength : Object {
  public abstract SVGLength baseVal { get; }
  public abstract SVGLength animVal { get; }
}

interface SVGLengthList {

  public abstract ulong numberOfItems { get; }

  public abstract void clear() throws GLib.Error;
  public abstract SVGLength initialize(SVGLength newItem) throws GLib.Error;
  public abstract SVGLength getItem(ulong index) throws GLib.Error;
  public abstract SVGLength insertItemBefore(SVGLength newItem,ulong index) throws GLib.Error;
  public abstract SVGLength replaceItem(SVGLength newItem, ulong index) throws GLib.Error;
  public abstract SVGLength removeItem(ulong index) throws GLib.Error;
  public abstract SVGLength appendItem(SVGLength newItem) throws GLib.Error;
}

public interface SVGAnimatedLengthList : Object {
  public abstract SVGLengthList baseVal { get; }
  public abstract SVGLengthList animVal { get; }
}

public interface SVGAngle : Object {
  public abstract ushort unitType { get; }
  public abstract  float value { get; set; }
  public abstract  float valueInSpecifiedUnits { get; set; }
  public abstract  string valueAsString { get; set; }

  public abstract void newValueSpecifiedUnits (ushort unitType, float valueInSpecifiedUnits) throws GLib.Error;
  public abstract void convertToSpecifiedUnits (ushort unitType) throws GLib.Error;
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

public interface SVGAnimatedAngle : Object {
  public abstract  SVGAngle baseVal { get; }
  public abstract  SVGAngle animVal { get; }
}

public interface SVGColor : Object, CSSValue {
  public abstract ushort colorType { get; }
  public abstract RGBColor rgbColor { get; }
  public abstract SVGICCColor iccColor { get; }

  void setRGBColor(string rgbColor) throws GLib.Error;
  void setRGBColorICCColor(string rgbColor, string iccColor) throws GLib.Error;
  void setColor(ushort colorType, string rgbColor, string iccColor) throws GLib.Error;

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

public interface SVGICCColor : Object {
  public abstract string colorProfile { get; set; }
  public abstract SVGNumberList colors { get; }
}

public interface SVGRect : Object {
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float width { get; set; }
  public abstract float height { get; set; }
}

public interface SVGAnimatedRect {
  public abstract SVGRect baseVal { get; }
  public abstract SVGRect animVal { get; }
}

/**
 * Unit Types
 */
public enum SVGUnitTypes {
  UNKNOWN = 0,
  USERSPACEONUSE = 1,
  OBJECTBOUNDINGBOX = 2
}

public interface SVGStylable : Object {

  public abstract  SVGAnimatedString className { get; }
  public abstract  CSSStyleDeclaration style { get; }

  public abstract CSSValue getPresentationAttribute (string name);
}

public interface SVGLocatable : Object {

  public abstract SVGElement nearestViewportElement { get; }
  public abstract SVGElement farthestViewportElement { get; }

  public abstract SVGRect getBBox();
  public abstract SVGMatrix getCTM();
  public abstract SVGMatrix getScreenCTM();
  public abstract SVGMatrix getTransformToElement(SVGElement element) throws GLib.Error;
}

public interface SVGTransformable : Objec, SVGLocatable {
  public abstract SVGAnimatedTransformList transform { get; }
}

public interface SVGTests : Object {

  public abstract SVGStringList requiredFeatures { get; }
  public abstract SVGStringList requiredExtensions { get; }
  public abstract SVGStringList systemLanguage { get; }

  public abstract boolean hasExtension (string extension);
}

public interface SVGLangSpace : Object {
  public abstract string xmllang { get; set; }
  public abstract string xmlspace { get; set; }
}

public interface SVGExternalResourcesRequired : Object {
  public abstract SVGAnimatedBoolean externalResourcesRequired { get; }
}

public interface SVGFitToViewBox : Object {
  public abstract SVGAnimatedRect viewBox { get; }
  public abstract SVGAnimatedPreserveAspectRatio preserveAspectRatio { get; }
}

public interface SVGZoomAndPan : Object {
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

public interface SVGViewSpec : Object,  SVGZoomAndPan,
                                        SVGFitToViewBox {
  public abstract SVGTransformList transform { get; }
  public abstract SVGElement viewTarget { get; }
  public abstract string viewBoxString { get; }
  public abstract string preserveAspectRatioString { get; }
  public abstract string transformString { get; }
  public abstract string viewTargetString { get; }
}

public interface SVGURIReference : Object {
  public abstract SVGAnimatedString href { get; }
}

public interface SVGCSSRule : Object, CSSRule {
  public enum Type {
    COLOR_PROFILE_RULE = 7
  }
}
/**
 * Rendering Intent Types
 */
public enum SVGRenderingIntent {
  UNKNOWN = 0,
  INTENT_AUTO = 1,
  PERCEPTUAL = 2,
  COLORIMETRIC = 3,
  SATURATION = 4,ç
  ABSOLUTE_COLORIMETRIC = 5
}

