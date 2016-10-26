/* css-interfaces.vala
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

// FIXME: This should be moved to its own library

/**
 * CSS interfaces according with https://www.w3.org/TR/SVG/ version 1.1
 */
public interface CSSStyleDeclaration : Object {
  public abstract string        cssText { get; set; }
  public abstract uint    length { get; set; }
  public abstract CSSRule          parentRule { get; set; }

  public abstract string          getPropertyValue(string propertyName);
  public abstract CSSValue           getPropertyCSSValue(string propertyName);
  public abstract string          removeProperty(string propertyName) throws GLib.Error;
  public abstract string          getPropertyPriority(string propertyName);
  public abstract void               setProperty(string propertyName,
                                     string value,
                                     string priority) throws GLib.Error;
  public abstract string          item(uint index);
}

public interface CSSValue : Object {
  public abstract string cssText { get; set; }
  public abstract uint cssValueType { get; }
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

public interface CSSRule : Object {
  public abstract uint   rtype { get; }
  public abstract string   cssText { get; set; }

  public abstract CSSStyleSheet parentStyleSheet { get; }
  public abstract CSSRule parentRule { get; }

  // RuleType
  public enum Type {
    UNKNOWN_RULE = 0,
    STYLE_RULE = 1,
    CHARSET_RULE = 2,
    IMPORT_RULE= 3,
    MEDIA_RULE = 4,
    FONT_FACE_RULE = 5,
    PAGE_RULE= 6
  }
}

public interface CSSStyleSheet : Object {
  public abstract CSSRule ownerRule { get; }
  public abstract CSSRuleList cssRules { get; }

  public abstract uint insertRule(string rule, uint index) throws GLib.Error;
  public abstract void deleteRule (uint index) throws GLib.Error;
}

public interface CSSRuleList : Object {
  public abstract uint length { get; }
  public abstract CSSRule item (uint index);
}


public interface DocumentCSS : Object {
  public abstract CSSStyleDeclaration getOverrideStyle(DomElement elt,
                                                      string pseudoElt);
}

public interface ViewCSS : Object {
  public abstract CSSStyleDeclaration getComputedStyle(DomElement elt,
                                                      string pseudoElt);
}

public interface CSSPrimitiveValue : Object, CSSValue {
  public abstract  uint   primitiveType { get; }

  public abstract void               setFloatValue(uint unitType,
                                   float floatValue) throws GLib.Error;
  public abstract float              getFloatValue(uint unitType) throws GLib.Error;
  public abstract void               setStringValue(uint stringType,
                                    string stringValue) throws GLib.Error;
  public abstract string          getStringValue() throws GLib.Error;
  public abstract CSSCounter            getCounterValue() throws GLib.Error;
  public abstract CSSRect               getRectValue() throws GLib.Error;
  public abstract CSSRGBColor           getRGBColorValue() throws GLib.Error;

  // UnitTypes
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
    PC = 10,
    DEG = 11,
    RAD = 12,
    GRAD = 13,
    MS = 14,
    S = 15,
    HZ = 16,
    KHZ = 17,
    DIMENSION = 18,
    STRING = 19,
    URI = 20,
    IDENT = 21,
    ATTR = 22,
    COUNTER = 23,
    RECT = 24,
    RGBCOLOR = 25
  }
}

/**
 * RGB Color Definition from DOM2
 */
public interface CSSCounter : Object {
  public abstract string        identifier { get; }
  public abstract string        listStyle { get; }
  public abstract string        separator { get; }
}

/**
 * RGB Color Definition from DOM2
 */
public interface CSSRGBColor : Object {
  public abstract CSSPrimitiveValue  red { get; }
  public abstract CSSPrimitiveValue  green { get; }
  public abstract CSSPrimitiveValue  blue { get; }
}


/**
 * Rect value taken from DOM2
 */
public interface CSSRect : Object {
  public abstract CSSPrimitiveValue  top { get; }
  public abstract CSSPrimitiveValue  right { get; }
  public abstract CSSPrimitiveValue  bottom { get; }
  public abstract CSSPrimitiveValue  left { get; }
}

} // GSvg
