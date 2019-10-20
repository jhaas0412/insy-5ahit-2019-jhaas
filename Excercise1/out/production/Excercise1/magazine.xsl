<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <magazine>
            <report>
                    <head>
                        <xsl:apply-templates select="report/authors/*"/>
                    </head>
                    <body>
                        <authors>
                            <xs:for-each select="description/authors/node()">
                                <xsl:choose>
                                    <xsl:when test="self::aref"> <!--wenn der knoten ein aref ist dann... wenn man das self nicht hinschreiben würde,
                                    würde man schauen ob der knoten einenn Kindknoten hat der aref heißt und das wäre der falsche Test-->
                                        <xsl:variable name="id"> <!--wir wollen uns nachher auf den wert beziehen im xpath ausdruck, deshlab variable-->
                                            <xsl:value-of select="@id"/>
                                        </xsl:variable>
                                        <xsl:variable name="author" select="/report/authors/*[@id = $id]"/> <!--da wird jetzt der Knoten selbst gespeichert, nicht nur die textdarstellung-->
                                        <!--xsl:value-of select="$author"/-->
                                        <xsl:if test="$author/name">
                                            <xsl:value-of select="$author/name"/>
                                        </xsl:if>
                                        <xsl:value-of
                                                select="concat($author/first-name, ' ', $author/middle-name, ' ', $author/last-name)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xs:for-each>
                        </authors>
                    </body>
            </report>
        </magazine>
    </xsl:template>

    <xsl:template match="authors/*">

        <author>
            <xsl:for-each select="*[not(deceased)]">
                <xsl:value-of select="text()"/>
            </xsl:for-each>
            <xsl:value-of select="concat(first-name/text(), middle-name, last-name)"/>
        </author>

    </xsl:template>

</xsl:stylesheet>