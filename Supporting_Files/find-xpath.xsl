<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:jc="http://james.blushingbunny.net/ns.html"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs xd" version="2.0">    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 4, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> jamesc</xd:p>
            <xd:p>Stylesheet to output a list of villages</xd:p>
            <xd:p>Parameters: files (takes filename wildcard, defaults to '*.xml') and recurse
                (defaults to 'no')</xd:p>
            <xd:p>Usage: saxon -it:main -o:outputFilename.html -xsl:find-villages.xsl files=*.xml
                recurse=yes</xd:p>
          <xd:p>Usage: saxon -it:main -o:outputFilename.html -xsl:find-villages..xsl files=*.xml </xd:p>
          <xd:p>Usage: saxon -it:main -o:outputFilename.html -xsl:find-villages..xsl files=foo.xml
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    
  <!-- files and recurse parameters defaulting to '*.xml' and 'no' respectively -->
    <xsl:param name="files" select="'*.xml'"/>
    <xsl:param name="recurse" select="'yes'"/>
  
  <!-- The main template, everything happens here. -->
    <xsl:template name="main">
        <!-- create path from params -->
        <xsl:variable name="path">
            <xsl:value-of
                select="concat('./?select=', $files,';on-error=warning;recurse=',$recurse)"/>
        </xsl:variable>
        <!-- the main collection of all the documents we are dealing with -->
        <xsl:variable name="docs" select="collection($path)"/>
      
      
      	
      
      <!--XPATH OF WHAT WE ARE TRYING TO FIND: CHANGE THIS!-->
	  <!-- Attribute and value = geogName[@type='forest'] -->
	  <!-- without attributes: $docs//region[not(@*)] -->
            <xsl:variable name="xpath" select="$docs//term[@type='occupation']"/>      
      
			<!-- 
				Run for these:

					bibl[not(@type)]
					bloc
					country[not(@type='repository')]	
					geogName
					orgName
					persName
					placeName[not(@type)]
					region
					roleName
					settlement[not(@type='repository')]
					term
					foreign
			 -->

            
      <!-- HTML Output -->
      <html>
            <head>
              <title>Output List</title>
            </head>
            <body>
              <title>Output List</title>
                
              <p>There are <xsl:value-of select="count($xpath)"/> of the XPath found 
                (<xsl:value-of select="count(distinct-values($xpath))"/> distinct ones).</p>
                
      
              <div>
                <h2>Distinct-Value List</h2>
              <ul>
                <xsl:for-each-group select="$xpath" group-by="concat(normalize-space(.), ';', @type)">
                  <xsl:sort select="lower-case(current-grouping-key())"/>
                  <xsl:for-each select="distinct-values(current-group()/normalize-space())">
                    <xsl:sort/>
                    <li>
                      <xsl:value-of select="."/>
                      (<xsl:value-of select="count($xpath[concat(normalize-space(.), ';', @type) = normalize-space(current-grouping-key())])"/>)
                      <xsl:if test="not(normalize-space(substring-after(current-grouping-key(), ';'))='')">[<xsl:value-of select="substring-after(current-grouping-key(), ';')"/>]</xsl:if>
                    </li>
                    
                  </xsl:for-each>
                  
                </xsl:for-each-group>
              </ul>
              </div>
              
              <div>
                <h2>Full List</h2>
                <ul>
                <xsl:for-each select="$xpath">
                  <xsl:sort select="lower-case(normalize-space(string(.)))"/>
                  <li><xsl:value-of select="normalize-space(string(.))"/>
                    <xsl:if test="@type"> [<xsl:value-of select="@type"/>]</xsl:if>
                  (<xsl:value-of select="jc:substring-after-last(base-uri(), '/')"/>)
                  </li>
                </xsl:for-each>
                </ul>
              </div>
              
            </body>
        </html>
    </xsl:template>
    
    
    <!-- Function to take last bit of file name path. -->
    
  <xsl:function name="jc:substring-after-last">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="substr" as="xs:string"/>
    <xsl:sequence 
      select="if ($substr) 
      then
      if (contains($input, $substr))
      then tokenize($input, $substr)[last( )] 
      else '' 
      else $input"/>
  </xsl:function>
  
    
</xsl:stylesheet>
