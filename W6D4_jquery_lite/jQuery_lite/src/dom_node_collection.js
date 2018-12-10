class DOMNodeCollection {
  constructor(elArray) {
    this.elArray = elArray;

  }

  html(str) {
    if (str === undefined) {
      return this.elArray[0].innerHTML;
    } else {
      for (let i = 0; i < this.elArray.length; i++) {
        this.elArray[i].innerHTML = str;
      }
    }
  }

  empty() {
    for (let i = 0; i < this.elArray.length; i++) {
      this.elArray[i].innerHTML = "";
    }
  }

  append(arg) {
    if (arg instanceof DOMNodeCollection) {
      const elements = arg.elArray;
      for (let i = 0; i < elements.length; i++) {
        this.append(elements[i].outerHTML);
      }
    } else if (arg instanceof HTMLElement) {
      this.append(arg.outerHTML);
    } else {

      for (let i = 0; i < this.elArray.length; i++) {
        this.elArray[i].innerHTML += arg;
      }

    }
  }

  attr(attrName, value) { // getter
    if (value === undefined) {
      this.elArray[0].getAttribute(attrName);
    } else {
      for (var i = 0; i < this.elArray.length; i++) {
        this.elArray[i].setAttribute(attrName, value);
      }
    }
  }

  addClass(className) {
    for (var i = 0; i < this.elArray.length; i++) {
      let attr = this.elArray[i].getAttribute("class");
      attr += ` ${className}`;
      this.elArray[i].setAttribute("class", attr);
    }
  }

  removeClass(className) {
    for (var i = 0; i < this.elArray.length; i++) {
      let attr = this.elArray[i].getAttribute("class");
      attr = attr.replace(className, "").trim();
      this.elArray[i].setAttribute("class", attr);
    }
  }

}



module.exports = DOMNodeCollection;
