## Zoo Park Management & Data Pipeline System

### Overview
A comprehensive Data Engineering project focused on building an XML-based management system for a Zoo Park. The project models complex real-world data including animal taxonomy, physical attributes, caretaking information, show schedules, and conservation threats.

### Key Components

#### 1. Schema Design & Validation (`zoo_park.dtd` & `zoo_park_new.xsd`)
* **Hierarchical Modeling:** Structured zoo infrastructure, ticket categories, park timings, and detailed animal classification (herbivores, carnivores, reproduction types).
* **Cross-Referencing:** Implemented `ID`/`IDREF` relational linkages between trainers, park operating days, and show schedules.
* **XSD Conversion:** Converted DTD rules into a fully compliant W3C XML Schema Definition (`.xsd`), incorporating data type constraints, required/optional attributes, and default values.

#### 2. Model Extension (`zoo_park_new2.xml` / `zoo_park_new2.dtd`)
* Extended the core data structure to accommodate feature enhancements such as certified caretaking staff, species adoption programs, media resources, dietary restrictions, and user-generated review systems (ratings/comments).

#### 3. Data Transformations & Querying (`XSLT 1.0/2.0`)
Implemented 5 distinct XSL stylesheets for data presentation and processing:
* **`present1.xsl`**: Recursive template rendering (`<xsl:apply-templates>`) to display animal lifespans, populations, and quantities in structured HTML tables.
* **`present2.xsl`**: Alphabetical ascending sorting of animal entries.
* **`present3.xsl`**: Conditional filtering using `<xsl:for-each>` to isolate animals with "Least Concern" IUCN threat status, sorted by wild population in descending order.
* **`present4.xsl`**: Custom XML-to-XML mapping generating an `<animals_to_see>` node tree containing animal-trainer relationships.
* **`present5.xsl`**: Advanced XPath filtering targeting public interactive shows (filtering for trainer speaking sessions with durations exceeding 20 minutes).

#### 4. Browser Presentation (`zoo_park.css`)
* Applied CSS styling directly to XML structures using card layouts, borders, pseudo-elements (`::before`/`::after`), and the `attr()` function to display XML attribute values visually on web pages.

This project was collaboratively developed as a team assignment within the framework of my undergraduate studies at the University of Piraeus.
