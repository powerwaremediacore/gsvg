/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-interfaces.vala
 *
 * Copyright (C) 2016-2017 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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

public interface ContainerElement : Object {
  // Shapes access
  public abstract RectElementMap rects { get; set; }
  public abstract CircleElementMap circles { get; set; }
  public abstract EllipseElementMap ellipses { get; set; }
  public abstract LineElementMap lines { get; set; }
  public abstract PolylineElementMap polylines { get; set; }
  public abstract PolygonElementMap polygons { get; set; }
  public abstract TextElementMap texts { get; set; }
}

public interface Element : Object, DomElement {
  public abstract string xmlbase { get; set; }
  // ownerSVGElement
  public abstract SVGElement? owner_svg_element { get; }
  // viewportElement
  public abstract Element? viewport_element { get; }

  // Styling properties
  // Fonts properties
  public abstract string font { get; set; }
  public abstract string font_family { get; set; }
  public abstract string font_size { get; set; }
  public abstract string font_size_adjust { get; set; }
  public abstract string font_stretch { get; set; }
  public abstract string font_style { get; set; }
  public abstract string font_variant { get; set; }
  public abstract string font_weight { get; set; }
  // Text properties
  public abstract string direction { get; set; }
  public abstract string letter_spacing { get; set; }
  public abstract string text_decoration { get; set; }
  public abstract string unicode_bidi { get; set; }
  public abstract string word_spacing { get; set; }
  // Other visual properties
  public abstract string clip { get; set; }
  public abstract string color { get; set; }
  public abstract string cursor { get; set; }
  public abstract string display { get; set; }
  public abstract string overflow { get; set; }
  public abstract string visibility { get; set; }
  // Clipping, Masking and Compositing properties
  public abstract string clip_path { get; set; }
  public abstract string clip_rule { get; set; }
  public abstract string mask { get; set; }
  public abstract string opacity { get; set; }
  // Filter Effects properties
  public abstract string enable_background { get; set; }
  public abstract string filter { get; set; }
  public abstract string flood_color { get; set; }
  public abstract string flood_opacity { get; set; }
  public abstract string lighting_color { get; set; }
  // Gradient properties
  public abstract string stop_color { get; set; }
  public abstract string stop_opacity { get; set; }
  // Interactivity properties
  public abstract string pointer_events { get; set; }
  // Color and painting properties
  public abstract string color_interpolation { get; set; }
  public abstract string color_interpolation_filter { get; set; }
  public abstract string color_profile { get; set; }
  public abstract string color_rendering { get; set; }
  public abstract string fill { get; set; }
  public abstract string fill_opacity { get; set; }
  public abstract string fill_rule { get; set; }
  public abstract string image_rendering { get; set; }
  public abstract string marker { get; set; }
  public abstract string maker_end { get; set; }
  public abstract string maker_mid { get; set; }
  public abstract string maker_start { get; set; }
  public abstract string shape_rendering { get; set; }
  public abstract string stroke { get; set; }
  public abstract string stroke_dasharray { get; set; }
  public abstract string stroke_dashoffset { get; set; }
  public abstract string stroke_linecap { get; set; }
  public abstract string stroke_linejoin { get; set; }
  public abstract string stroke_miterlimit { get; set; }
  public abstract string stroke_opacity { get; set; }
  public abstract string stroke_width { get; set; }
  public abstract string text_rendering { get; set; }
  // Other text properties
  public abstract string alignment_baseline { get; set; }
  public abstract string baseline_shift { get; set; }
  public abstract string dominant_baseline { get; set; }
  public abstract string glyph_orientation_horizontal { get; set; }
  public abstract string glyph_orientation_vertical { get; set; }
  public abstract string kerning { get; set; }
  public abstract string text_anchor { get; set; }
  public abstract string writing_mode { get; set; }
}

public interface AnimatedBoolean : Object {
  public abstract bool baseVal { get; set; }
  public abstract bool animVal { get; }
}

public interface AnimatedString : Object, GomProperty {
  public abstract string base_val { get; set; }
  public abstract string anim_val { get; set; }
}

public interface StringList : Object {

  public abstract int numberOfItems { get; }
  public abstract void clear () throws GLib.Error;
  public abstract string initialize (string newItem) throws GLib.Error;
  public abstract string getItem (int index) throws GLib.Error;
  public abstract string insertItemBefore (string newItem, int index) throws GLib.Error;
  public abstract string replaceItem (string newItem, int index) throws GLib.Error;
  public abstract string removeItem (int index) throws GLib.Error;
  public abstract string appendItem (string newItem) throws GLib.Error;
}


public interface AnimatedEnumeration : Object {
  public abstract int baseVal { get; set; }
  public abstract int animVal { get; }
}

public interface AnimatedInteger : Object {
  public abstract long baseVal { get; set; }
  public abstract long animVal { get; }
}

public interface Number : Object {
  public abstract double value { get; set; }
}

public interface AnimatedNumber : Object {
  public abstract double base_val { get; set; }
  public abstract double anim_val  { get; set; }
}

public interface NumberList : Object {

  public abstract int number_of_items { get; }

  public abstract void clear() throws GLib.Error;
  public abstract Number initialize (Number newItem) throws GLib.Error;
  public abstract Number get_item (int index) throws GLib.Error;
  public abstract Number insert_item_before (Number newItem, int index) throws GLib.Error;
  public abstract Number replace_item (Number newItem, int index) throws GLib.Error;
  public abstract Number remove_item (int index) throws GLib.Error;
  public abstract Number append_item (Number newItem) throws GLib.Error;
  /**
   * Translate a string to and from a list of {@link Number} items
   */
  public abstract string? value { owned get; set; }
}

public interface AnimatedNumberList : Object, GomProperty {
  public abstract NumberList base_val { get; set; }
  public abstract NumberList anim_val { get; set; }
}

public interface Length : Object {
  public abstract Length.Type unit_type { get; construct set; }
  public abstract double value { get; set; }
  public abstract double value_in_specified_units { get; set; }
  public abstract string value_as_string { get; set; }

  public abstract void new_value_specified_units (Length.Type unit_type,
                                                double value_in_specified_units)
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

public interface AnimatedLength : Object, GomProperty {
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
public interface AnimatedLengthCX : Object, AnimatedLength {}
public interface AnimatedLengthCY : Object, AnimatedLength {}
public interface AnimatedLengthR : Object, AnimatedLength {}

public interface LengthList : Object {

  public abstract int number_of_items { get; }

  public abstract void clear() throws GLib.Error;
  public abstract Length initialize (Length newItem) throws GLib.Error;
  public abstract Length get_item (int index) throws GLib.Error;
  public abstract Length insert_item_before (Length newItem,int index) throws GLib.Error;
  public abstract Length replace_item (Length newItem, int index) throws GLib.Error;
  public abstract Length remove_item (int index) throws GLib.Error;
  public abstract Length append_item (Length newItem) throws GLib.Error;
  // Added API
  /**
   * From/to string property, parsing tokens
   */
  public abstract string? value { owned get; set; }
}

public interface AnimatedLengthList : Object, GomProperty {
  public abstract LengthList base_val { get; }
  public abstract LengthList anim_val { get; }
}

public interface Angle : Object {
  public abstract int unitType { get; }
  public abstract  double value { get; set; }
  public abstract  double valueInSpecifiedUnits { get; set; }
  public abstract  string valueAsString { get; set; }

  public abstract void newValueSpecifiedUnits (int unitType, double valueInSpecifiedUnits) throws GLib.Error;
  public abstract void convertToSpecifiedUnits (int unitType) throws GLib.Error;
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
  public abstract int colorType { get; }
  public abstract CSSRGBColor rgbColor { get; }
  public abstract ICCColor iccColor { get; }

  public abstract void setRGBColor(string rgbColor) throws GLib.Error;
  public abstract void setRGBColorICCColor(string rgbColor, string iccColor) throws GLib.Error;
  public abstract void setColor(int colorType, string rgbColor, string iccColor) throws GLib.Error;

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

public interface Rect : Object, GomProperty {
  public abstract double x { get; set; }
  public abstract double y { get; set; }
  public abstract double width { get; set; }
  public abstract double height { get; set; }

  public abstract string to_string ();
  public abstract void parse (string str);
}

public interface AnimatedRect : Object, GomProperty {
  public abstract Rect base_val { get; }
  public abstract Rect anim_val { get; }
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
  public abstract AnimatedTransformList transform { get; set; }
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
  public abstract AnimatedRect view_box { get; set; }
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
  public abstract AnimatedString href { get; set; }
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
