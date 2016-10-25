/* gsvg-dom-public public interfaces-filter.vala
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

public interface CursorElement : Object, Element,
                             URIReference,
                             Tests,
                             ExternalResourcesRequired {
  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
}

public interface AElement : Object, Element,
                        URIReference,
                        Tests,
                        LangSpace,
                        ExternalResourcesRequired,
                        Stylable,
                        Transformable {
  public abstract AnimatedString target { get; }
}

public interface ViewElement : Object, Element,
                           ExternalResourcesRequired,
                           FitToViewBox,
                           ZoomAndPan {
  public abstract StringList viewTarget { get; }
}

public interface ScriptElement : Object, Element,
                             URIReference,
                             ExternalResourcesRequired {
  public abstract string type { get; set; }
}

public interface ZoomEvent : Object/*, UIEvent*/ {
  public abstract Rect zoomRectScreen { get; }
  public abstract float previousScale { get; }
  public abstract Point previousTranslate { get; }
  public abstract float newScale { get; }
  public abstract Point newTranslate { get; }
}

public interface ElementTimeControl {
  public abstract void beginElement();
  public abstract void beginElementAt(float offset);
  public abstract void endElement();
  public abstract void endElementAt(float offset);
}

public interface TimeEvent : Object, DomEvent {

// TODO: This is not devined in DOM4
//  public abstract AbstractView view { get; }
  public abstract long detail { get; }
// TODO: This is not devined in DOM4
//  void initTimeEvent(string typeArg, AbstractView viewArg, long detailArg);
}

public interface AnimationElement : Object, Element,
                                Tests,
                                ExternalResourcesRequired,
                                ElementTimeControl {

  public abstract Element targetElement { get; }

  public abstract float getStartTime()throws GLib.Error;
  public abstract float getCurrentTime();
  public abstract float getSimpleDuration()throws GLib.Error;
}

public interface AnimateElement : Object, AnimationElement,
                              Stylable {
}

public interface SetElement : Object, AnimationElement {
}

public interface AnimateMotionElement : Object, AnimationElement {
}

public interface MPathElement : Object, Element,
                            URIReference,
                            ExternalResourcesRequired {
}

public interface AnimateColorElement : Object, AnimationElement,
                                   Stylable {
}

public interface AnimateTransformElement : Object, AnimationElement {
}

} // GSvg
