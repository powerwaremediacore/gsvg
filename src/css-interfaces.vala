/* css-interfaces.vala
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
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
 * CSS interfaces according with https://www.w3.org/TR/SVG/ version 1.1
 */
public interface GSvg.CSSStyleDeclaration : Object {
  public abstract string        cssText { get; set; }
  public abstract ulong    length { get; set; }
  public abstract CSSRule          parentRule { get; set; }

  public abstract string          getPropertyValue(in DOMString propertyName);
  public abstract CSSValue           getPropertyCSSValue(in DOMString propertyName);
  public abstract string          removeProperty(in DOMString propertyName)
                                        raises(DOMException);
  public abstract string          getPropertyPriority(in DOMString propertyName);
  public abstract void               setProperty(in DOMString propertyName,
                                 in DOMString value,
                                 in DOMString priority)
                                        raises(DOMException);
  public abstract string          item(in unsigned long index);
}

public interface GSvg.CSSValue : Object {


  public abstract string cssText { get; set; }
  public abstract ushort cssValueType { get; }
  /**
   * UnitTypes
   */
  public enum Type {
    INHERIT= 0,
    PRIMITIVE_VALUE = 1,
    VALUE_LIST = 2,
    CUSTOM = 3
  }
}

public interface GSvg.CSSRule : Object {
  public abstract ushort   type { get; }
  public abstract string        cssText { get; set; }

  public abstract CSSStyleSheet parentStyleSheet { get; }
  public abstract CSSRule parentRule { get; }

  // RuleType
  public enum Type {
    UNKNOWN_RULE = 0,
    STYLE_RULE = 1
    CHARSET_RULE = 2,
    IMPORT_RULE= 3,
    MEDIA_RULE = 4,
    FONT_FACE_RULE = 5,
    PAGE_RULE= 6
  }
}

public interface GSvg.CSSStyleSheet : Object {
  public abstract CSSRule ownerRule { get; }
  public abstract CSSRuleList cssRules { get; }

  public abstract ulong insertRule(string rule, ulong index) throws GLib.Error;
  public abstract void deleteRule (ulong index) throws GLib.Error;
}

interface GSvg.CSSRuleList {
  public abstract ulong length { get; }
  public abstract CSSRule item (ulong index);
}


public interface DocumentCSS : Object {
  public abstract CSSStyleDeclaration getOverrideStyle(DomElement elt,
                                                      string pseudoElt);
}

public interface ViewCSS : Object {
  public abstract CSSStyleDeclaration getComputedStyle(DomElement elt,
                                                      string pseudoElt);
}
