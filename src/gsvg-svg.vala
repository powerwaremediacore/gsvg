/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016,2017 Daniel Espinosa <esodan@gmail.com>
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

public class GSvg.GsElement : GSvg.GsObject,
                        GSvg.Element,
                        GSvg.Stylable {
  protected SVGElement _owner_svg_element;
  protected Element _viewport_element;
  protected AnimatedString _class;
  protected CSSStyleDeclaration _style;
  // Element
  [Description (nick="::xml:base")]
  public string xmlbase { get; set; }
  public SVGElement? owner_svg_element {
    get { return _owner_svg_element; }
  }
  public Element? viewport_element { get { return _viewport_element; } }
  // Stylable
  [Description (nick="::class")]
  public AnimatedString? class_name {
    get { return _class; } construct set { _class = value; }
  }
  [Description (nick="::style")]
  public CSSStyleDeclaration? style {
    get { return _style; } construct set { _style = value; }
  }

  public CSSValue? get_presentation_attribute (string name) { return null; }

}

/**
 * Base class for SVG and basic types elements
 */
public class GSvg.GsCommonElement : GsElement,
                        Tests,
                        LangSpace,
                        ExternalResourcesRequired,
                        Locatable
{
  // Tests
  protected StringList _required_features;
  protected StringList _required_extensions;
  protected StringList _system_language;
  protected AnimatedBoolean _external_resources_required;
  protected Element _nearest_viewport_element;
  protected Element _farthest_viewport_element;
    // requiredFeatures
  public StringList required_features { get { return _required_features;} }
  // requiredExtensions
  public StringList required_extensions { get { return _required_extensions; } }
  // systemLanguage
  public StringList system_language { get { return _system_language; } }

  public bool has_extension (string extension) { return false; }
  // LangSpace
  [Description (nick="::xml:lang")]
  public string xmllang { get; set; }
  [Description (nick="::xml:space")]
  public string xmlspace { get; set; }
  // ExternalResourcesRequired
  // * externalResourcesRequired
  public AnimatedBoolean external_resources_required {
    get { return _external_resources_required; }
  }
  // Locatable
  // nearestViewportElement
  public Element nearest_viewport_element { get { return _nearest_viewport_element; } }
  // farthestViewportElement
  public Element farthest_viewport_element { get { return _farthest_viewport_element; } }

  public Rect get_bbox () { return null; }
  public Matrix get_ctm () { return null; }
  public Matrix get_screen_ctm () { return null; }
  public Matrix get_transform_to_element (Element element) throws GLib.Error { return null; }
}
/**
 * 'svg' node.
 */
public class GSvg.GsSvg : GSvg.GsCommonElement,
                        FitToViewBox,
                        ZoomAndPan,
                        ViewCSS,
                        DocumentCSS,
                        GSvg.SVGElement
{
  protected AnimatedLength _x;
  protected AnimatedLength _y;
  protected AnimatedLength _width;
  protected AnimatedLength _height;
  protected Rect _viewport;
  protected float _pixel_unit_to_millimeter_x;
  protected float _pixel_unit_to_millimeter_y;
  protected float _screen_pixel_to_millimeter_x;
  protected float _screen_pixel_to_millimeter_y;
  protected bool _use_current_view;
  protected ViewSpec _current_view;
  protected AnimatedRect _view_box;
  protected AnimatedPreserveAspectRatio _preserve_aspect_ratio;
  protected Point _current_translate;

  // FitToViewBox
  // * viewBox
  public AnimatedRect view_box { get { return _view_box; } }
  // preserveAspectRatio
  public AnimatedPreserveAspectRatio preserve_aspect_ratio {
    get { return _preserve_aspect_ratio; }
  }
  // ZoomAndPan
  // * zoomAndPan
  public int zoom_and_pan { get; set; }
  // ViewCSS
  public CSSStyleDeclaration get_computed_style (DomElement elt,
                                                      string pseudoElt)
  {
    return null;
  }
  // DocumentCSS
  public CSSStyleDeclaration get_override_style (DomElement elt,
                                                string pseudoElt)
  {
    return null;
  }
  // SVGElement
  [Description (nick="::x")]
  public AnimatedLength x { get { return _x; } construct set { _x = value; } }
  [Description (nick="::y")]
  public AnimatedLength y { get { return _y; } construct set { _y = value; } }
  [Description (nick="::width")]
  public AnimatedLength width { get { return _width; } construct set { _width = value; } }
  [Description (nick="::height")]
  public AnimatedLength height { get { return _height; } construct set { _height = value; } }
  [Description (nick="::contentScriptType")]
  public string content_script_type { get; set; }
  [Description (nick="::contentStyleType")]
  public string content_style_type { get; set; }
  [Description (nick="::viewport")]
  public Rect viewport { get { return _viewport; } }
  //pixelUnitToMillimeterX
  public float pixel_unit_to_millimeter_x { get { return _pixel_unit_to_millimeter_x; } }
  //pixelUnitToMillimeterY
  public float pixel_unit_to_millimeter_y { get { return _pixel_unit_to_millimeter_y; } }
  //screenPixelToMillimeterX
  public float screen_pixel_to_millimeter_x { get { return _screen_pixel_to_millimeter_x; } }
  //screenPixelToMillimeterY
  public float screen_pixel_to_millimeter_y { get { return _screen_pixel_to_millimeter_y; } }
  //useCurrentView
  public bool use_current_view { get { return _use_current_view; } }
  //currentView
  public ViewSpec current_view { get { return _current_view; } }
  //currentScale
  public float current_scale { get; set; }
  // currentTranslate
  public Point current_translate { get { return _current_translate; } }

  construct {
    _local_name = "svg";
    try {
      set_attribute_ns ("http://www.w3.org/2000/xmlns/",
                      "xmlns:svg", "http://www.w3.org/2000/svg");
    } catch (GLib.Error e) {
      warning (("Error setting default namespace: %s").printf (e.message));
    }
  }

  public void initialize (GSvg.GsSvg? parent,
                          AnimatedLength? x,
                          AnimatedLength? y,
                          AnimatedLength? width,
                          AnimatedLength? height,
                          AnimatedString? class_name,
                          CSSStyleDeclaration? style) {
    if (parent != null) {
      _document = parent.owner_document;
      _owner_svg_element = parent;
    }
    _x = x;
    _y = y;
    _width = width;
    _height = height;
    _class = class_name;
    _style = style;
  }

  //currentTranslate
  public  uint suspend_redraw (uint maxWaitMilliseconds) { return 0; }
  public  void unsuspend_redraw (uint suspendHandleID) {}
  public  void unsuspend_redrawAll () {}
  public  void force_redraw () {}
  public  void pause_animations () {}
  public  void unpause_animations () {}
  public  bool animations_paused () { return false; }
  public  float get_current_time () { return (float) 0.0; }
  public  void set_current_time (float seconds) {}
  public  NodeList get_intersection_list (Rect rect, Element referenceElement) {
    return null;
  }
  public  NodeList get_enclosure_list (Rect rect, Element referenceElement) {
    return null;
  }
  public  bool check_intersection (Element element, Rect rect) { return false; }
  public  bool check_enclosure (Element element, Rect rect) { return false; }
  public  void deselect_all () {}
  // Creators
  public  Number create_svg_number () { return null; }
  public  Length create_svg_length () { return null; }
  public  Angle create_svg_angle () { return null; }
  public  Point create_svg_point () { return null; }
  public  Matrix create_svg_matrix() { return null; }
  public  Rect create_svg_rect () {
    var r = new GsRectElement ();
    r.x = new GsAnimatedLengthX ();
    r.y = new GsAnimatedLengthY ();
    r.width = new GsAnimatedLengthWidth ();
    r.height = new GsAnimatedLengthHeight ();
    r.rx = new GsAnimatedLengthRX ();
    r.ry = new GsAnimatedLengthRY ();
    return r as Rect;
  }
  public  Transform create_svg_transform () { return null; }
  public  Transform create_svg_transform_from_matrix (Matrix matrix) { return null; }
  /**
   * Query elements by 'id' property
   */
  public  DomElement? get_element_by_id (string elementId) { return null; }
  // Shape constructors
  /**
   * @x a string representation of an {@link AnimatedLengthX}
   * @y a string representation of an {@link AnimatedLengthY}
   * @width a string representation of an {@link AnimatedLengthWidth}
   * @height a string representation of an {@link AnimatedLengthHeight}
   * @rx a string representation of an {@link AnimatedLengthRX}
   * @ry a string representation of an {@link AnimatedLengthRY}
   *
   * Creates a 'rect' node for rectangular shapes.
   */
  public RectElement create_rect (string? x,
                                  string? y,
                                  string? width,
                                  string? height,
                                  string? rx,
                                  string? ry) {
    GsAnimatedLengthX nx = null;
    if (x != null) {
      nx = new GsAnimatedLengthX ();
      nx.value = x;
    }
    GsAnimatedLengthY ny = null;
    if (y != null) {
      ny = new GsAnimatedLengthY ();
      ny.value = y;
    }
    GsAnimatedLengthWidth nw = null;
    if (width != null) {
      nw = new GsAnimatedLengthWidth();
      nw.value = width;
    }
    GsAnimatedLengthHeight nh = null;
    if (height != null) {
      nh = new GsAnimatedLengthHeight ();
      nh.value = height;
    }
    GsAnimatedLengthRX nrx = null;
    if (rx != null) {
      nrx = new GsAnimatedLengthRX ();
      nrx.value = rx;
    }
    GsAnimatedLengthRY nry = null;
    if (ry != null) {
      nry = new GsAnimatedLengthRY ();
      nry.value = ry;
    }
    var r = Object.new (typeof (GsRectElement),
                        "owner_document", this.owner_document)
                        as RectElement;
    r.x = nx;
    r.y = ny;
    r.width = nw;
    r.height = nh;
    r.rx = nrx;
    r.ry = nry;
    return r;
  }
  /**
   * @cx a string representation of an {@link AnimatedLengthCX}
   * @cy a string representation of an {@link AnimatedLengthCY}
   * @r a string representation of an {@link AnimatedLengthR}
   *
   * Creates a 'circle' node for circle shapes.
   */
  public CircleElement create_circle (string? cx,
                                  string? cy,
                                  string? cr) {
    GsAnimatedLengthCX nx = null;
    if (cx != null) {
      nx = new GsAnimatedLengthCX ();
      nx.value = cx;
    }
    GsAnimatedLengthCY ny = null;
    if (cy != null) {
      ny = new GsAnimatedLengthCY ();
      ny.value = cy;
    }
    GsAnimatedLengthR nr = null;
    if (cr != null) {
      nr = new GsAnimatedLengthR ();
      nr.value = cr;
    }
    var c = Object.new (typeof (GsCircleElement),
                        "owner_document", this.owner_document)
                        as CircleElement;
    c.cx = nx;
    c.cy = ny;
    c.r = nr;
    return c;
  }
  /**
   * @cx a string representation of an {@link AnimatedLengthCX}
   * @cy a string representation of an {@link AnimatedLengthCY}
   * @rx a string representation of an {@link AnimatedLengthRX}
   * @ry a string representation of an {@link AnimatedLengthRY}
   *
   * Creates a 'ellipse' node for ellipse shapes.
   */
  public EllipseElement create_ellipse (string? cx,
                                  string? cy,
                                  string? crx,
                                  string? cry) {
    GsAnimatedLengthCX nx = null;
    if (cx != null) {
      nx = new GsAnimatedLengthCX ();
      nx.value = cx;
    }
    GsAnimatedLengthCY ny = null;
    if (cy != null) {
      ny = new GsAnimatedLengthCY ();
      ny.value = cy;
    }
    GsAnimatedLengthRX nrx = null;
    if (crx != null) {
      nrx = new GsAnimatedLengthRX ();
      nrx.value = crx;
    }
    GsAnimatedLengthRY nry = null;
    if (cry != null) {
      nry = new GsAnimatedLengthRY ();
      nry.value = cry;
    }
    var e = Object.new (typeof (GsEllipseElement),
                        "owner_document", this.owner_document)
                        as EllipseElement;
    e.cx = nx;
    e.cy = ny;
    e.rx = nrx;
    e.ry = nry;
    return e;
  }
}
