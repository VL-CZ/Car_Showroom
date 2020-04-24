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

    <xsl:template match="car-showroom/cars/car">
        <h3>Car</h3>
        <div>
            Model:
        </div>
        <div>
            Price: <xsl:value-of select="price"/>
        </div>
        <div>
            Engine: <xsl:value-of select="engine/@fuel"/> <xsl:value-of select="engine/@type"/>
        </div>
        <div>
            
        </div>
    </xsl:template>

</xsl:stylesheet>