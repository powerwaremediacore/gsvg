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
  [Description (nick="::id")]
  public abstract string id { get; set; }
  [Description (nick="::xml:base")]
  public abstract string xmlbase { get; set; }
  // ownerSVGElement
  public abstract SVGElement? owner_svg_element { get; }
  // viewportElement
  public abstract Element? viewport_element { get; }
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
  public abstract Length.Type unit_type { get; construct set; }
  public abstract float value { get; set; }
  public abstract float value_in_specified_units { get; set; }
  public abstract string value_as_string { get; set; }

  public abstract void new_value_specified_units (Length.Type unit_type,
                                                float value_in_specified_units)
                                                throws GLib.Error;
  public abstract void convert_to_specified_units (Length.Type unit_type) throws GLib.Error;

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
  // baseVal
  public abstract Length base_val { get; construct set; }
  // animVal
  public abstract Length anim_val { get; }
}

public interface AnimatedLengthX : Object, AnimatedLength {}
public interface AnimatedLengthY : Object, AnimatedLength {}
public interface AnimatedLengthWidth : Object, AnimatedLength {}
public interface AnimatedLengthHeight : Object, AnimatedLength {}
public interface AnimatedLengthRX : Object, AnimatedLength {}
public interface AnimatedLengthRY : Object, AnimatedLength {}

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
  [Description (nick="::class")]
  public abstract  AnimatedString? class_name { get; construct set; }
  [Description (nick="::style")]
  public abstract  CSSStyleDeclaration? style { get; construct set;  }

  public abstract CSSValue? get_presentation_attribute (string name);
}

public interface Locatable : Object {
  // nearestViewportElement
  public abstract Element nearest_viewport_element { get; }
  // farthestViewportElement
  public abstract Element farthest_viewport_element { get; }

  public abstract Rect get_bbox();
  public abstract Matrix get_ctm ();
  public abstract Matrix get_screen_ctm ();
  public abstract Matrix get_transform_to_element (Element element) throws GLib.Error;
}

public interface Transformable : Object, Locatable {
  public abstract AnimatedTransformList transform { get; }
}

public interface Tests : Object {
  // requiredFeatures
  public abstract StringList required_features { get; }
  // requiredExtensions
  public abstract StringList required_extensions { get; }
  // systemLanguage
  public abstract StringList system_language { get; }

  public abstract bool has_extension (string extension);
}

public interface LangSpace : Object {
  public abstract string xmllang { get; set; }
  public abstract string xmlspace { get; set; }
}

public interface ExternalResourcesRequired : Object {
  // externalResourcesRequired
  public abstract AnimatedBoolean external_resources_required { get; }
}

public interface FitToViewBox : Object {
  // viewBox
  public abstract AnimatedRect view_box { get; }
  // preserveAspectRatio
  public abstract AnimatedPreserveAspectRatio preserve_aspect_ratio { get; }
}

public interface ZoomAndPan : Object {
  public abstract int zoom_and_pan { get; set; }

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
