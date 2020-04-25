<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
            method="html"
            version="4.0"
            encoding="UTF-8"
            indent="yes"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    />

    <!-- promenna reprezentujici nadpis se jmenem spolecnosti -->
    <xsl:variable name="company-name">
        <xsl:element name="h2">
            <xsl:text>MY Car showroom</xsl:text>
        </xsl:element>
    </xsl:variable>

    <!-- sablona pro vytvoreni zakladni kostry HTMl stranky -->
    <xsl:template match="/">
        <html>
            <head>
                <title>MY Car showroom</title>
            </head>
            <body>
                <xsl:copy-of select="$company-name"/>
                <h3>Cars</h3>
                <xsl:apply-templates select="car-showroom/cars/car" mode="carDetail"/>

                <xsl:apply-templates select="car-showroom/contact-info"/>
            </body>
        </html>
    </xsl:template>

    <!-- tato sablona vytvori detail nabidky auta -->
    <xsl:template match="cars/car" mode="carDetail">
        <div style="background: LightGray">
            <xsl:apply-templates select="." mode="carModel"/>
            <div>
                Price: <xsl:value-of select="price"/>
            </div>
            <div>
                Engine: <xsl:apply-templates select="engine"/>
            </div>
            <div>
                Color: <xsl:value-of select="color"/>
            </div>
            <xsl:if test="four-wheel-drive">
                <div>
                    <xsl:text>4x4</xsl:text>
                </div>
            </xsl:if>
            <div>
                <xsl:apply-templates select="feature-list"/>
            </div>
        </div>
    </xsl:template>

    <!-- sablona pro vytvoreni nazvu modelu auta (nejdrive vytvori element h4 s atributem modelID a pro vypsani
    znacky a modelu auta zavola sablonu car-model-info s parametrem modelID) -->
    <xsl:template match="cars/car" mode="carModel">
        <xsl:element name="h4">
            <xsl:attribute name="modelID">
                <xsl:value-of select="@model"/>
            </xsl:attribute>
            <xsl:call-template name="car-model-info">
                <xsl:with-param name="modelID" select="@model"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <!-- tato sablona vraci text ve formatu "{brand} {model}"  - pozaduje parametr modelID (ID daneho modelu auta) -->
    <xsl:template name="car-model-info">
        <xsl:param name="modelID"/>

        <xsl:variable name="carBrand" select="//car-models/car-model[@id-car-model=$modelID]/brand"/>
        <xsl:variable name="carModel" select="//car-models/car-model[@id-car-model=$modelID]/model"/>

        <xsl:value-of select="$carBrand"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$carModel"/>

    </xsl:template>

    <!-- tato sablona slouzi k vypisu informaci o motoru auta -->
    <xsl:template match="cars/car/engine">
        <ul>
            <li>
                Fuel: <xsl:value-of select="@fuel"/>
            </li>
            <li>
                Type: <xsl:value-of select="@type"/>
            </li>
        </ul>
    </xsl:template>

    <!-- tato sablona pomoci for-each cyklu vypise vsechny prvky vybavy daneho auta -->
    <xsl:template match="cars/car/feature-list">
        <div>Features</div>
        <ul>
            <xsl:for-each select="feature">
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- sablona vypisujici kontaktni informace-->
    <xsl:template match="contact-info">
        <div>
            <xsl:copy-of select="$company-name"/>
            <div>
                Email: <xsl:value-of select="email"/>
            </div>
            <div>
                Phone: <xsl:value-of select="phone-number"/>
            </div>
            <div>
                Address:
                <xsl:value-of select="address/street"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="address/city"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="address/country"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>