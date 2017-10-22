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
  public abstract string title { get; }
  public abstract string referrer { get; }
  public abstract string doma{ get; }
  public abstract string URL { get; }
  public abstract SVGElement rootElement { get; }
}

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
                          DocumentCSS {

  public abstract AnimatedLength x { get; set; }
  public abstract AnimatedLength y { get;  set; }
  public abstract AnimatedLength width { get;  set; }
  public abstract AnimatedLength height { get;  set; }
  public abstract string content_script_type { get; set; }
  public abstract string content_style_type { get; set; }
  public abstract Rect viewport { get; }
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
  public abstract NodeList get_intersection_list (Rect rect, Element referenceElement);
  public abstract NodeList get_enclosure_list (Rect rect, Element referenceElement);
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
  public abstract RectElement create_rect (string? x,
                                  string? y,
                                  string? width,
                                  string? height,
                                  string? rx,
                                  string? ry,
                                  string? style = null);
  /**
   * @cx a string representation of an {@link AnimatedLengthCX}
   * @cy a string representation of an {@link AnimatedLengthCY}
   * @r a string representation of an {@link AnimatedLengthR}
   *
   * Creates a 'circle' node for circle shapes.
   */
  public abstract CircleElement create_circle (string? cx,
                                  string? cy,
                                  string? cr,
                                  string? style = null);
  /**
   * @cx a string representation of an {@link AnimatedLengthCX}
   * @cy a string representation of an {@link AnimatedLengthCY}
   * @rx a string representation of an {@link AnimatedLengthRX}
   * @ry a string representation of an {@link AnimatedLengthRY}
   *
   * Creates a 'ellipse' node for ellipse shapes.
   */
  public abstract EllipseElement create_ellipse (string? cx,
                                  string? cy,
                                  string? crx,
                                  string? cry,
                                  string? style = null);
  /**
   * @lx1 a string representation of an {@link AnimatedLengthCX}
   * @lx2 a string representation of an {@link AnimatedLengthCY}
   * @lx1 a string representation of an {@link AnimatedLengthRX}
   * @ly2 a string representation of an {@link AnimatedLengthRY}
   *
   * Creates a 'line' node for line shapes.
   */
  public abstract LineElement create_line (string? lx1,
                                  string? ly1,
                                  string? lx2,
                                  string? ly2,
                                  string? style = null);
  /**
   * @points a string representation of an {@link ArrayList<Point>}
   *
   * Creates a 'line' node for line shapes.
   */
  public abstract PolylineElement create_polyline (GLib.Queue<Point> points,
                                   string? style = null);
  /**
   * @
   *
   * Creates a 'line' node for line shapes.
   */
  public abstract TextElement create_text (string? text,
                                   string? xs,
                                   string? ys,
                                   string? dxs,
                                   string? dys,
                                   string? rotates,
                                   string? style = null);
}

public interface GElement : Object,
                        Element,
                        Tests,
                        LangSpace,
                        ExternalResourcesRequired,
                        Stylable,
                        Transformable {
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
