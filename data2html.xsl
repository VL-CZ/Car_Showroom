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
            <xsl:apply-templates select="car-showroom/cars/car" mode="carDetail"/>
        </div>
    </xsl:template>

    <xsl:template match="cars/car" mode="carDetail">
        <xsl:apply-templates select="." mode="carModel"/>
        <div>
            Price:
            <xsl:value-of select="price"/>
        </div>
        <div>
            Engine:
            <xsl:apply-templates select="engine"/>
        </div>
        <div>
            Color:
            <xsl:value-of select="color"/>
        </div>
        <xsl:if test="four-wheel-drive">
            <div>
                <xsl:text>Four wheel drive</xsl:text>
            </div>
        </xsl:if>
        <div>
            <xsl:apply-templates select="feature-list"/>
        </div>
    </xsl:template>

    <xsl:template match="cars/car" mode="carModel">
        <xsl:call-template name="car-model-info">
            <xsl:with-param name="modelID" select="@model"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="car-model-info">
        <xsl:param name="modelID"/>

        <xsl:variable name="carBrand" select="//car-models/car-model[@id-car-model=$modelID]/brand"/>
        <xsl:variable name="carModel" select="//car-models/car-model[@id-car-model=$modelID]/model"/>

        <xsl:element name="h3">
            <xsl:attribute name="modelID">
                <xsl:value-of select="$modelID"/>
            </xsl:attribute>

            <xsl:value-of select="$carBrand"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$carModel"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="cars/car/engine">
        <ul>
            <li>
                Fuel:
                <xsl:value-of select="@fuel"/>
            </li>
            <li>
                Type:
                <xsl:value-of select="@type"/>
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
            <div>Email:
                <xsl:value-of select="email"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>