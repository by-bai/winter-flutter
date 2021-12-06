# Understanding Widgets

## What is a widget?

A widget is a building block for your user interface. Using widgets is like combining Legos.

## UI = f(state)

Think of widgets as a function of UI. Given a state, the build() method of a widget constructs the widget UI (screen).

## Examples

-   **Container widget**: styles, decorates and positions widgets.
-   **Column widget**: displays other widgets vertically.
-   **Custom widget**: display custom info.
-   **Expanded widget**: use a widget to fill the remaining space.
-   **Stack widget**: place widgets on top of each other.
-   **Positioned widget**: controls a widget's position in the stack.

## Widget trees

-   Every widget contains a build() method
-   In the build() method, create a UI composition by nesting widgets within other widgets
-   Forming a tree-like data structure.
-   Each widget can contain other widgets, commonly called children.
-   Widget tree provides a blueprint that describes how you want to lay out your UI
-   The framework traverses the nodes in the tree and calls each build() method to compose entire UI

![Widget tree](./image01.png)

## Flutter's architecture

-   Framework (Dart)
    -   **Material or Cupertino** are UI control libraries built on top of the widget layer, they make UI look and feel like Android and iOS apps, respectively.
    -   **Widgets** layer is a composition abstraction on widgets, containing all primitive classes needed to create UI controls.
    -   **Rendering** layer is a layout abstraction that draws and handles the widget's layout.
    -   **Foundation** aka dart:ui layer contains core libraries that handle animation, painting and gestures.
-   Engine (C/C++)
-   Embedder (Platform-specific)

## Flutter manages 3 trees in parallel

1. **Widget**: public API or blueprint for the framework. Developers usually just deal with composing widgets.
2. **Element**: manages a widget and a widget's render object. for every widget instance in the tree, there is a corresponding element.
3. **RenderObject**: responsible for drawing and laying out a specific widget instance. also handles user interactions like hit-testing and gestures.

The element tree manages each widget instance and associates a render object to tell the framework how to render a particular widget.

## Types of elements

1. **ComponentElement**: composed of other elements. corresponds to composing widgets inside other widgets
2. **RenderObjectElement**: holds render object

Think of **ComponentElement** as a group of elements, and **RenderObjectElement** as a single element. Each element contains a render object to perform widget painting, layout and hit testing.
