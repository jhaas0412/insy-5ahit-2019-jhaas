<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">

        <term>
            <xsl:apply-templates select="/npn-term/*"/>
        </term>
    </xsl:template>


    <xsl:template match="or">
        <xsl:text>( </xsl:text>
        <xsl:apply-templates select="./*[1]"/>
        <xsl:text>or </xsl:text>
        <xsl:apply-templates select="./*[2]"/>
        <xsl:text>) </xsl:text>
    </xsl:template>

    <xsl:template match="and">
        <xsl:text>( </xsl:text>
        <xsl:apply-templates select="./*[1]"/>
        <xsl:text>and </xsl:text>
        <xsl:apply-templates select="./*[2]"/>
        <xsl:text>) </xsl:text>
    </xsl:template>

    <xsl:template match="not">
        <xsl:text>!( </xsl:text>
        <xsl:apply-templates select="./*"/>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <xsl:template match="term">
        <xsl:value-of select="./text()"/>
        <xsl:text> </xsl:text>
    </xsl:template>

</xsl:stylesheet>