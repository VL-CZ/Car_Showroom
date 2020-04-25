<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
            method="html"
            version="4.0"
            encoding="UTF-8"
            indent="yes"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    />

    <xsl:template match="/">
        <html>
            <head>
                <title>Car showroom</title>
            </head>
            <body>
                <h2>Cars</h2>
            </body>
        </html>
        <div>
            <xsl:apply-templates select="car-showroom/cars/car"/>
        </div>
    </xsl:template>

    <xsl:template match="cars/car">
        <xsl:element name="h3">
            <xsl:text>Car</xsl:text>
        </xsl:element>
        <div>
            Price: <xsl:value-of select="price"/>
        </div>
        <div>
            Engine: <xsl:apply-templates select="engine"/>
        </div>
        <div>
            Color: <xsl:value-of select="color"/>
        </div>
        <div>
            <xsl:if test="four-wheel-drive">
                <xsl:text>Four wheel drive</xsl:text>
            </xsl:if>
        </div>
        <div>
            <xsl:apply-templates select="feature-list"/>
        </div>
    </xsl:template>

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

    <xsl:template name="contact">
        <div>
            <div>Email: <xsl:value-of select="email"/></div>
        </div>
    </xsl:template>

</xsl:stylesheet>