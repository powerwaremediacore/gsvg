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

public interface SVGElement : Element,
                          Tests,
                          LangSpace,
                          ExternalResourcesRequired,
                          Stylable,
                          Locatable,
                          FitToViewBox,
                          ZoomAndPan,
                          ViewCSS,
                          DocumentCSS {

  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
  public abstract AnimatedLength width { get; }
  public abstract AnimatedLength height { get; }
  public abstract string contentScriptType { get; set; }
  public abstract string contentStyleType { get; set; }
  public abstract Rect viewport { get; }
  public abstract float pixelUnitToMillimeterX { get; }
  public abstract float pixelUnitToMillimeterY { get; }
  public abstract float screenPixelToMillimeterX { get; }
  public abstract float screenPixelToMillimeterY { get; }
  public abstract bool useCurrentView { get; }
  public abstract ViewSpec currentView { get; }
  public abstract float currentScale { get; set; }
  public abstract Point currentTranslate { get; }

  public abstract ulong suspendRedraw(ulong maxWaitMilliseconds);
  public abstract void unsuspendRedraw(ulong suspendHandleID);
  public abstract void unsuspendRedrawAll();
  public abstract void forceRedraw();
  public abstract void pauseAnimations();
  public abstract void unpauseAnimations();
  public abstract bool animationsPaused();
  public abstract float getCurrentTime();
  public abstract void setCurrentTime(float seconds);
  public abstract NodeList getIntersectionList(Rect rect, Element referenceElement);
  public abstract NodeList getEnclosureList(Rect rect, Element referenceElement);
  public abstract bool checkIntersection(Element element, Rect rect);
  public abstract bool checkEnclosure(Element element, Rect rect);
  public abstract void deselectAll();
  public abstract Number createSVGNumber();
  public abstract Length createSVGLength();
  public abstract Angle createSVGAngle();
  public abstract Point createSVGPoint();
  public abstract Matrix createSVGMatrix();
  public abstract Rect createSVGRect();
  public abstract Transform createSVGTransform();
  public abstract Transform createSVGTransformFromMatrix(Matrix matrix);
  public abstract DomElement getElementById(string elementId);
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

  public abstract ulong lengthg { get; }

  public abstract ElementInstance item (ulong index);
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
