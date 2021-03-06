/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-interfaces-struct.vala
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
public interface Document : Object,  DomDocument {
  public abstract string title { owned get; }
  public abstract string referrer { get; }
  public abstract string domain { get; }
  public abstract string url { get; }
  public abstract SVGElement root_element { owned get; }

  public abstract void read_from_string (string str) throws GLib.Error;
  public abstract void read_from_file (GLib.File file) throws GLib.Error;
  public abstract string write_string () throws GLib.Error;

  /**
   * Adds an 'svg' to the document. It should be top most element in the tree.
   *
   * If you plan to set more complex descriptions, set @param desc to null.
   *
   * @param x a string representation of {@link AnimatedLength}, for x position, or null
   * @param y a string representation of {@link AnimatedLength}, for y position, or null
   * @param width a string representation of {@link AnimatedLength}, for width, or null
   * @param height a string representation of {@link AnimatedLength}, for height, or null
   * @param viewbox a string representation of {@link AnimatedRect}, or null
   * @param title a string for SVG title, or null
   * @param desc a string for a text description, or null
   */
  public abstract SVGElement add_svg (string? x,
                            string? y,
                            string? width,
                            string? height,
                            string? viewbox = null,
                            string? title = null,
                            string? desc = null);
}

/**
 * Top level SVG Element node according with [[https://www.w3.org/TR/SVG/]] version 1.1
 */
public interface SVGElement : Object,
                          Element,
                          Tests,
                          LangSpace,
                          ExternalResourcesRequired,
                          Stylable,
                          Locatable,
                          FitToViewBox,
                          ZoomAndPan,
                          ViewCSS,
                          DocumentCSS,
                          ContainerElement {

  public abstract AnimatedLength x { get; set; }
  public abstract AnimatedLength y { get;  set; }
  public abstract AnimatedLength width { get;  set; }
  public abstract AnimatedLength height { get;  set; }
  public abstract string content_script_type { get; set; }
  public abstract string content_style_type { get; set; }
  public abstract Rect viewport { get; set; }
  public abstract float pixel_unit_to_millimeter_x { get; }
  public abstract float pixel_unit_to_millimeter_y { get; }
  public abstract float screen_pixel_to_millimeter_x { get; }
  public abstract float screen_pixel_to_millimeter_y { get; }
  public abstract bool use_current_view { get; }
  public abstract ViewSpec current_view { get; }
  public abstract float current_scale { get; set; }
  public abstract Point current_translate { get; }

  public abstract uint suspend_redraw (uint maxWaitMilliseconds);
  public abstract void unsuspend_redraw (uint suspendHandleID);
  public abstract void unsuspend_redrawAll ();
  public abstract void force_redraw ();
  public abstract void pause_animations ();
  public abstract void unpause_animations ();
  public abstract bool animations_paused ();
  public abstract float get_current_time ();
  public abstract void set_current_time (float seconds);
  public abstract DomNodeList get_intersection_list (Rect rect, Element referenceElement);
  public abstract DomNodeList get_enclosure_list (Rect rect, Element referenceElement);
  public abstract bool check_intersection (Element element, Rect rect);
  public abstract bool check_enclosure (Element element, Rect rect);
  public abstract void deselect_all ();
  public abstract Number create_svg_number ();
  public abstract Length create_svg_length ();
  public abstract Angle create_svg_angle ();
  public abstract Point create_svg_point ();
  public abstract Matrix create_svg_matrix ();
  public abstract Rect create_svg_rect ();
  public abstract Transform create_svg_transform ();
  public abstract Transform create_svg_transform_from_matrix (Matrix matrix);
  public abstract DomElement? get_element_by_id (string elementId);
  // API additions
  public abstract void read_from_string (string str);
  public abstract string write_string ();
  // Shapes creation
  /**
   * Creates a 'rect' node for rectangular shapes.
   *
   * @param x a string representation of an {@link AnimatedLengthX}
   * @param y a string representation of an {@link AnimatedLengthY}
   * @param width a string representation of an {@link AnimatedLengthWidth}
   * @param height a string representation of an {@link AnimatedLengthHeight}
   * @param rx a string representation of an {@link AnimatedLengthRX}
   * @param ry a string representation of an {@link AnimatedLengthRY}
   */
  public abstract RectElement create_rect (string? x,
                                  string? y,
                                  string? width,
                                  string? height,
                                  string? rx,
                                  string? ry,
                                  string? style = null);
  /**
   * Creates a 'circle' node for circle shapes.
   *
   * @param cx a string representation of an {@link AnimatedLengthCX}
   * @param cy a string representation of an {@link AnimatedLengthCY}
   * @param cr a string representation of an {@link AnimatedLengthR}
   * @param style a string with style information
   */
  public abstract CircleElement create_circle (string? cx,
                                  string? cy,
                                  string? cr,
                                  string? style = null);
  /**
   * Creates a 'ellipse' node for ellipse shapes.
   *
   * @param cx a string representation of an {@link AnimatedLengthCX}
   * @param cy a string representation of an {@link AnimatedLengthCY}
   * @param crx a string representation of an {@link AnimatedLengthRX}
   * @param cry a string representation of an {@link AnimatedLengthRY}
   * @param style a string with style information
   */
  public abstract EllipseElement create_ellipse (string? cx,
                                  string? cy,
                                  string? crx,
                                  string? cry,
                                  string? style = null);
  /**
   * Creates a 'line' node for line shapes.
   *
   * @param lx1 a string representation of an {@link AnimatedLengthCX}
   * @param lx2 a string representation of an {@link AnimatedLengthCY}
   * @param lx1 a string representation of an {@link AnimatedLengthRX}
   * @param ly2 a string representation of an {@link AnimatedLengthRY}
   * @param style a string with style information
   */
  public abstract LineElement create_line (string? lx1,
                                  string? ly1,
                                  string? lx2,
                                  string? ly2,
                                  string? style = null);
  /**
   * Creates a 'line' node for line shapes.
   *
   * @param points a string representation of a list of {@link Point}
   * @param style a string with style information
   */
  public abstract PolylineElement create_polyline (string points,
                                   string? style = null);
  /**
   * Creates a 'line' node for line shapes.
   *
   * @param points a string representation of a list of {@link Point}
   * @param style a string with style information
   */
  public abstract PolygonElement create_polygon (string points,
                                   string? style = null);
  /**
   * Creates a 'line' node for line shapes.
   *
   * @param text a text to be displayed
   * @param xs a list of coordinates
   * @param ys a list of coordinates
   * @param dxs a list of coordinates
   * @param dys a list of coordinates
   * @param rotates a list of numbers
   * @param style a string with style information
   */
  public abstract TextElement create_text (string? text,
                                   string? xs,
                                   string? ys,
                                   string? dxs,
                                   string? dys,
                                   string? rotates,
                                   string? style = null);
  /**
   * Adds a definitions element node.
   */
  public abstract DefsElement add_defs ();
  /**
   * Adds a grouping element node.
   */
  public abstract GElement add_g ();
  /**
   * Adds a 'title' node to current SVG one.
   *
   * @param text a title to be added
   */
  public abstract TitleElement add_title (string text);
  /**
   * Adds a description 'desc' node to current SVG one.
   *
   * @param text a text to be added to description or null, if custome values will be added
   */
  public abstract DescElement add_desc (string? text);
  /**
   * Adds a 'metadata' node to current SVG one.
   */
  public abstract MetadataElement add_metadata ();
}

public interface SVGElementMap : Object {
  public abstract int length { get; }
  public abstract SVGElement get (string id);
}


public interface GElement : Object,
                        Element,
                        Tests,
                        LangSpace,
                        ExternalResourcesRequired,
                        Stylable,
                        Transformable,
                        ContainerElement {
}

public interface GElementMap : Object {
  public abstract int length { get; }
  public abstract GElement get (string id);
}

public interface DefsElement : Object,
                             Element,
                             Tests,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable,
                             Transformable {
}

public interface DescElement : Object,
                           Element,
                           LangSpace,
                           Stylable {
}

public interface TitleElement : Object,
                            Element,
                            LangSpace,
                            Stylable {
}

public interface SymbolElement : Object,
                             Element,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable,
                             FitToViewBox {
}

public interface UseElement : Element,
                          URIReference,
                          Tests,
                          LangSpace,
                          ExternalResourcesRequired,
                          Stylable,
                          Transformable {
  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
  public abstract AnimatedLength width { get; }
  public abstract AnimatedLength height { get; }
  public abstract ElementInstance instanceRoot { get; }
  public abstract ElementInstance animatedInstanceRoot { get; }
}

public interface ElementInstance : Object, DomEventTarget {
  public abstract Element correspondingElement { get; }
  public abstract UseElement correspondingUseElement { get; }
  public abstract ElementInstance parentNode { get; }
  public abstract ElementInstanceList childNodes { get; }
  public abstract ElementInstance firstChild { get; }
  public abstract ElementInstance lastChild { get; }
  public abstract ElementInstance previousSibling { get; }
  public abstract ElementInstance nextSibling { get; }
}

public interface ElementInstanceList : Object {

  public abstract uint lengthg { get; }

  public abstract ElementInstance item (uint index);
}

public interface ImageElement : Object,
                            Element,
                            URIReference,
                            Tests,
                            LangSpace,
                            ExternalResourcesRequired,
                            Stylable,
                            Transformable {
  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
  public abstract AnimatedLength width { get; }
  public abstract AnimatedLength height { get; }
  public abstract AnimatedPreserveAspectRatio preserveAspectRatio { get; }
}

public interface SwitchElement : Object,
                             Element,
                             Tests,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable,
                             Transformable {
}

public interface GetSVGDocument {
  public abstract Document getSVGDocument();
}

} // GSvg
