<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html [ <!ENTITY nbsp "&#160;"> ]> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="https://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:jc="https://james.blushingbunny.net/ns.html"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs xd tei jc"
	version="2.0">
<!-- /*xmlns="http://www.w3.org/TR/REC-html40"*/ -->
<!-- Useful for DTDs https://www.w3.org/TR/xhtml1/dtds.html#h-A2 -->
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Author:</xd:b> Adrian S. Wisnicki</xd:p>
			<xd:p>Rewire LO XSL to Create OMV XSL</xd:p>
			<xd:p>May 2020</xd:p>
			<xd:p>Creative Commons Attribution 4.0 International (https://creativecommons.org/licenses/by/4.0/)</xd:p>
		</xd:desc>
	</xd:doc>

	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

	<!-- Incoming parameters -->
	<xsl:param name="page" select="'0001'"/>
	<xsl:param name="paged" select="'true'"/>

	<!-- Transform these to global variables in case they are needed anywhere -->
	<xsl:variable name="pagenumber" select="$page"/>
	<xsl:variable name="isPaged" select="$paged"/>

	<xsl:template match="/">
		<xsl:variable name="additional-authors-1">			
			<xsl:choose>
				<xsl:when test="//teiHeader//titleStmt/author[@role='normalized']">
					<xsl:text>, </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='normalized']" separator=", "/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="text-creator">
			<xsl:text>Recovered text by </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/> <xsl:text>; published by One More Voice.</xsl:text>
		</xsl:variable>
		<xsl:variable name="object-creator">
			<xsl:text>Visual material by </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/> <xsl:text>; published by the One More Voice digital recovery project.</xsl:text>
		</xsl:variable>
		<xsl:variable name="LEAP-ID">
			<xsl:value-of select="//idno[@type='LEAP-ID']"/>
		</xsl:variable>
		<html lang="en">
			<head>
				<meta charset="UTF-8" />
				<title><!--<xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/>, --><xsl:value-of select="//teiHeader//titleStmt/title[1]"/> | One More Voice</title>
				<xsl:choose>
					<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">
						<meta name="description" content="{$object-creator}" />
					</xsl:when>
					<xsl:otherwise>
						<meta name="description" content="{$text-creator}" />
					</xsl:otherwise>
				</xsl:choose>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<meta name="robots" content="index, follow"/>
				<meta name="theme-color" content="#204A79"/>
				<link rel="apple-touch-icon" sizes="180x180" href="/img/icons/apple-touch-icon-180x180.png"></link>
				<link rel="icon" type="image/png" sizes="32x32" href="/img/icons/favicon-32x32.png"></link>
				<link rel="icon" type="image/png" sizes="16x16" href="/img/icons/favicon-16x16.png"></link>
				<link rel="manifest" href="/site.webmanifest"></link>
				<link rel="preload" as="style" href="/css/style.css?=newVers_0023" onload="this.rel='stylesheet'"></link>
				<link rel="preload" as="style" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" onload="this.rel='stylesheet'" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></link>
				<link rel="preload" as="style" href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css" onload="this.rel='stylesheet'" integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY=" crossorigin="anonymous" referrerpolicy="no-referrer"></link>
				<noscript>
					<link rel="stylesheet" type="text/css" href="/css/style.css?=newVers_0023"></link>
					<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></link>
					<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css" integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY=" crossorigin="anonymous" referrerpolicy="no-referrer"></link>
				</noscript>
				<link rel="preconnect" href="https://fonts.googleapis.com"></link>
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""></link>
				<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@400;700&amp;family=Merriweather:wght@400;700;900&amp;family=Source+Sans+Pro:wght@400;600&amp;family=Amaranth:wght@400;700&amp;display=swap"></link>
				<link rel="stylesheet" type="text/css" href="/css/critical.css?=newVers_0024"></link>
				<script src="https://www.googletagmanager.com/gtag/js?id=UA-31768072-5" async=""></script>
				<script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments)}gtag('js',new Date());gtag('config','UA-31768072-5');</script>
			</head>

			<!-- Site code first adapted from Adrian S. Wisnicki's Fieldwork of Empire website (https://awisnicki.github.io/fieldwork_of_empire/) which is released under a Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) license (https://creativecommons.org/licenses/by-nc/4.0/). -->
			<!-- Informed throughout by https://w3c.github.io/aria-practices/examples/ -->

			<xsl:variable name="material-link">
				<xsl:choose>
					<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">/visual_materials.html</xsl:when>
					<xsl:otherwise>/texts.html</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
	
			<xsl:variable name="material">
				<xsl:choose>
					<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">Visual Materials</xsl:when>
					<xsl:otherwise>Recovered Texts</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<body class="transcription materials" id="body">

				<header id="header">
					<!-- #skip adapted from https://webaim.org/techniques/skipnav/ -->
					<div id="skip">
						<a href="#main" id="skiptocontent" tabindex="0">skip to main</a>
					</div>					
					<nav class="breadcrumbs">
						<ul>
							<li id="level-1"><a href="/">Home</a></li>
							<li id="level-2"><a href="/materials.html">Historical Materials</a></li>
							<li id="level-3"><a href="{$material-link}"><xsl:value-of select="$material"/></a></li>
							<li id="level-4"><xsl:value-of select="//teiHeader//titleStmt/title[1]"/></li>
						</ul>
					</nav>
					<div class="nav-container" data-include="header">
						<nav class="fallback">
							<span class="logo-container">
								<a href="/index.html">
									<img width="38" height="38" src="/img/logo/OMV-logo-87px.jpg" srcset="/img/logo/OMV-logo-87px.jpg 87w, /img/logo/OMV-logo-78px.jpg 78w, /img/logo/OMV-logo-72px.jpg 72w, /img/logo/OMV-logo-58px.jpg 58w, /img/logo/OMV-logo-39px.jpg 39w, /img/logo/OMV-logo-36px.jpg 36w, /img/logo/OMV-logo-29px.jpg 29w" sizes="(min-width: 768px) 39px, (min-width: 480px) 36px, 29px" alt="One More Voice logo in white on a blue field." title="Home"/>    
									<h1>One More Voice</h1>
								</a>
							</span>
							<a href="/site_sections.html" class="hamburger-menu" title="Menu" aria-label="Show site sections">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</a>
						</nav>
					</div>
					<div id="overlay-menu" class="overlay" data-include="overlay"></div>
				</header>
		
				<!-- <main id="main" aria-labelledby="archival-material">
			
					<section class="content">
						<div class="decoration"></div>
						<article id="content"> -->
							<xsl:apply-templates select="TEI"/>
						<!-- </article>
						<div class="decoration"></div>
					</section>
				</main>-->
	
				<div data-include="footer"></div>
		
				<button onclick="topFunction()" ontouchend="topFunction()" id="topButton" aria-label="Scroll to top" title="Scroll to top" tabindex="0">Top</button>
				<xsl:if test="/TEI/text[contains(@n,'cedarville')]"><link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&amp;display=swap" rel="stylesheet"></link></xsl:if>
				<xsl:if test="/TEI/text[contains(@n,'dancing')]"><link href="https://fonts.googleapis.com/css2?family=Dancing+Script&amp;display=swap" rel="stylesheet"></link></xsl:if>
				<xsl:if test="/TEI/text[contains(@n,'parisienne')]"><link href="https://fonts.googleapis.com/css2?family=Parisienne&amp;display=swap" rel="stylesheet"></link></xsl:if>
				<xsl:if test="/TEI/text[contains(@n,'pinyon')]"><link href="https://fonts.googleapis.com/css2?family=Pinyon+Script&amp;display=swap" rel="stylesheet"></link></xsl:if>
				<xsl:if test="/TEI/text[contains(@n,'unifrakturM')]"><link href="https://fonts.googleapis.com/css2?family=UnifrakturMaguntia&amp;display=swap" rel="stylesheet"></link></xsl:if>
				<link rel="stylesheet" type="text/css" href="/css/styleTEI.css?=newVers_0005"></link>
				<xsl:if test="/TEI/text[contains(@n,'rotate-toggle')]">
					<link rel="stylesheet" type="text/css" href="/css/rotate-toggle.css?=newVers_0002"></link>
				</xsl:if>
				<xsl:if test="//xenoData[@type='css']">
					<style>
						<xsl:value-of select="//xenoData[@type='css']"/>
					</style>
				</xsl:if>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
				<script>
					// Includes HTML snippets; adapted from https://stackoverflow.com/a/31837264
					$(function(){var includes=$('[data-include]');jQuery.each(includes,function(){var file='/common/'+$(this).data('include')+'.html?=newVers_0009';$(this).load(file)})});
				</script>
				<script>
					//Scroll to top button; adapted from https://www.w3schools.com/howto/howto_js_scroll_to_top.asp
					var mybutton=document.getElementById("topButton");window.onscroll=function(){scrollFunction()};function scrollFunction(){if(document.body.scrollTop>700||document.documentElement.scrollTop>700){mybutton.style.display="flex";mybutton.style.visibility="visible"}else{mybutton.style.display="none";mybutton.style.visibility="hidden"}};function topFunction(){document.body.scrollTop=0;document.documentElement.scrollTop=0};
				</script>
				<xsl:if test="//sourceDesc/msDesc[@type='manuscript']">
					<script src="/js/manuscript-transform.js"></script>
				</xsl:if>
				<xsl:if test="//sourceDesc/biblStruct [@type='journal']">
					<script src="/js/journal-transform.js"></script>
				</xsl:if>
				<xsl:if test="//figure[@n='hist-object' and @change='rotate-90']">
					<!-- Image Rotation -->
					<!-- Adapted from https://www.w3schools.com/howto/howto_js_toggle_class.asp and https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/Switch_role -->
					<script>function myFunction(){var element1=document.getElementById("rotate-button");var element2=document.getElementById("image-to-rotate");if(element1.getAttribute("aria-checked")=="true"){element1.setAttribute("aria-checked","false")}else{element1.setAttribute("aria-checked","true")}element1.classList.toggle("click-color");element2.classList.toggle("rotate-90")}</script>
				</xsl:if>
				<xsl:if test="//figure[@n='hist-object' and @change='rotate-180']">
					<!-- Image Rotation -->
					<!-- Adapted from https://www.w3schools.com/howto/howto_js_toggle_class.asp and https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/Switch_role -->
					<script>function myFunction(){var element1=document.getElementById("rotate-button");var element2=document.getElementById("image-to-rotate");if(element1.getAttribute("aria-checked")=="true"){element1.setAttribute("aria-checked","false")}else{element1.setAttribute("aria-checked","true")}element1.classList.toggle("click-color");element2.classList.toggle("rotate-180")}</script>
				</xsl:if>
				<script>function googleTranslateElementInit(){new google.translate.TranslateElement({pageLanguage:'en'},'google_translate_element')}</script>
				<script>
					// Loads scripts after page load; adapted from https://learn.jquery.com/using-jquery-core/document-ready/ and https://stackoverflow.com/a/39179486
					$(window).on("load",function(){var element=document.createElement("script");element.type="text/javascript";element.src="/js/scripts.js?=newVers_0020";document.body.appendChild(element)});
					$(window).on("load",function(){var element=document.createElement("script");element.type="text/javascript";element.src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";document.body.appendChild(element)});
				</script>
			</body>
		</html>
	</xsl:template>

	<!-- Don't show -->
	<xsl:template match="teiHeader|facsimile|surface|zone"/>

	<!-- The following section is key as it sets up the whole text and chooses one of three paths, either manuscript, journal, or object (archive, book, journal). -->
	<!-- TEI -->
	<xsl:template match="TEI">
		<xsl:variable name="body-color-front">
			<xsl:if test="//front/@n[1]">
				<xsl:text>background:#</xsl:text><xsl:apply-templates select="//front/@n[1]"/><xsl:text>;</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="body-color-back">
			<xsl:if test="//back/@n[1]">
				<xsl:text>background:#</xsl:text><xsl:apply-templates select="//back/@n[1]"/><xsl:text>;</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="body-color">
			<xsl:if test="//body/@n[1]">
				<xsl:text>background:#</xsl:text><xsl:apply-templates select="//body/@n[1]"/><xsl:text>;</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="front">
			<xsl:choose>
				<xsl:when test="//front"/>
				<xsl:otherwise>none</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="back">
			<xsl:choose>
				<xsl:when test="//back"/>
				<xsl:otherwise>none</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="encoding">
			<xsl:choose>
				<xsl:when test="//teiHeader//respStmt/name">
					<xsl:value-of select="//teiHeader//respStmt/name[not(.=preceding::name)]" separator=", "/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//teiHeader//revisionDesc/change/name[not(.=preceding::name)]" separator=", "/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="sortedDates" as="xs:string*">
			<xsl:choose>
				<xsl:when test="//revisionDesc/change[@when]">
					<xsl:perform-sort select="//revisionDesc/change/@when[not(.=preceding::change/@when)]"><xsl:sort select="." order="ascending"/></xsl:perform-sort>
				</xsl:when>
				<xsl:otherwise>
					<xsl:perform-sort select="//revisionDesc/change/date[not(.=preceding::change/date)]"><xsl:sort select="." order="ascending"/></xsl:perform-sort>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="additional-authors-1">			
			<xsl:choose>
				<xsl:when test="//teiHeader//titleStmt/author[@role='normalized']">
					<xsl:text>; </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='normalized']" separator="; "/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="additional-authors-2">			
			<xsl:choose>
				<xsl:when test="//teiHeader//titleStmt/author[@role='normalized']">
					<xsl:text>; </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='normalized']" separator="; "/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="citation-authorship">
				<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
				<xsl:value-of select="$additional-authors-2"/>
		</xsl:variable>
		<xsl:variable name="period-after-name">
			<xsl:choose>
				<xsl:when test="$citation-authorship[ends-with(text(), '.')]"/>
				<xsl:otherwise>
					<xsl:text>.</xsl:text>							
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="object-description">
			<xsl:choose>
				<xsl:when test="//teiHeader//sourceDesc/msDesc/physDesc/objectDesc">											
					<p><strong>Object description:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/physDesc/objectDesc/p"/></p>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="repo-location">
			<xsl:text> (</xsl:text><xsl:value-of select="string-join((//sourceDesc/msDesc/msIdentifier/settlement, //sourceDesc/msDesc/msIdentifier/country), ', ')"/><xsl:text>)</xsl:text>
		</xsl:variable>
		<xsl:variable name="show-repo-location">
			<xsl:choose>
				<xsl:when test="//sourceDesc/msDesc/msIdentifier/country/text() and //sourceDesc/msDesc/msIdentifier/settlement/text()">
					<xsl:copy-of select="$repo-location"/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="repository">
			<xsl:choose>
				<xsl:when test="//teiHeader//sourceDesc/msDesc/msIdentifier/repository/text()">															<p><strong>Repository:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/msIdentifier/repository" /><xsl:copy-of select="$show-repo-location"/></p>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="collection-link">
			<xsl:value-of select="//sourceDesc/msDesc/msIdentifier/collection/@ref"/>
		</xsl:variable>
		<xsl:variable name="collection-spec">
			<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc/msIdentifier/collection[@ref]">
				<a aria-label="External Link" href="{$collection-link}"><xsl:value-of select="//sourceDesc/msDesc/msIdentifier/collection"/></a>
			</xsl:when>
			<xsl:when test="not(//sourceDesc/msDesc/msIdentifier/collection[@ref])">
				<xsl:value-of select="//sourceDesc/msDesc/msIdentifier/collection"/>
			</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="collection">
			<xsl:choose>
				<xsl:when test="//teiHeader//sourceDesc/msDesc/msIdentifier/collection/text()">															<p><strong>Collection:</strong><xsl:text> </xsl:text><xsl:copy-of select="$collection-spec"/><xsl:copy-of select="$show-repo-location"/></p>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="shelfmark">
			<xsl:choose>
				<xsl:when test="//teiHeader//sourceDesc/msDesc/msIdentifier/idno[@type='shelfmark']/text()">											<p><strong>Shelfmark / Identifier:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/msIdentifier/idno[@type='shelfmark']" /></p>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="license1">
			<xsl:value-of select="//teiHeader//publicationStmt/availability/licence[1]/@target"/>
		</xsl:variable>
		<xsl:variable name="license2">
			<xsl:value-of select="//teiHeader//publicationStmt/availability/licence[2]/@target"/>
		</xsl:variable>
		<xsl:variable name="availP1">
			<xsl:apply-templates select="//availability/p[1]/node()"/>
		</xsl:variable>
		<xsl:variable name="availP2">
			<xsl:apply-templates select="//availability/p[2]/node()"/>
		</xsl:variable>
		<xsl:variable name="copyright">
			<xsl:choose>
			<xsl:when test="//availability/licence[@target]">
				<xsl:copy-of select="$availP1"/><xsl:text> </xsl:text><a aria-label="External Link"  href="{$license1}"><xsl:value-of select="//teiHeader//publicationStmt/availability/licence[1]"/></a>
				<xsl:if test="//availability/p[2]">
					<xsl:text>. </xsl:text><xsl:copy-of select="$availP2"/><xsl:text> </xsl:text><a aria-label="External Link" href="{$license2}"><xsl:value-of select="//teiHeader//publicationStmt/availability/licence[2]"/></a>.
				</xsl:if>
			</xsl:when>
			<xsl:when test="not(//availability/licence[@target])">
				<xsl:copy-of select="$availP1"/><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//publicationStmt/availability/licence"/>
			</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="LEAP-ID">
			<xsl:value-of select="//idno[@type='LEAP-ID']"/>
		</xsl:variable>
		<xsl:variable name="pub-deets">
			<xsl:variable name="title">
				<xsl:if test="//teiHeader//sourceDesc/biblStruct[@type='journal']//title">
					<xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//title"/>
				</xsl:if>
				<xsl:if test="//teiHeader//sourceDesc/biblStruct[@type='object-book-journal']//title">
					<xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='object-book-journal']//title"/>
				</xsl:if>
			</xsl:variable>
			<xsl:variable name="period-after-date">
				<xsl:choose>
					<xsl:when test="//sourceDesc/biblStruct/monogr/imprint/biblScope[@unit='pages'][ends-with(text(), '.')]">
						<xsl:text> </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>. </xsl:text>							
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="//sourceDesc/biblStruct/monogr[contains(@n,'book-section')]">
					<xsl:text>In </xsl:text>
					<xsl:if test="//sourceDesc/biblStruct/monogr/imprint/biblScope[@unit='section']/text()">
						<xsl:text>“</xsl:text><xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/biblScope[@unit='section']"/><xsl:text>,” </xsl:text>
					</xsl:if>
					<em><xsl:value-of select="$title"/></em>
					<xsl:if test="//sourceDesc/biblStruct/monogr/author/text()">
						<xsl:text>, by </xsl:text>
						<xsl:value-of select="//sourceDesc/biblStruct/monogr/author" separator=" and "/>
					</xsl:if>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/biblScope[@unit='pages']"/>
					<xsl:value-of select="$period-after-date"/>
					<xsl:if test="//sourceDesc/biblStruct/monogr/editor/text()">
						<xsl:text>Edited by </xsl:text><xsl:value-of select="//sourceDesc/biblStruct/monogr/editor" separator="; "/><xsl:text>. </xsl:text>
					</xsl:if>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/pubPlace" separator="; "/>
					<xsl:text>: </xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/publisher" separator="; "/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/date"/>
					<xsl:text>.</xsl:text>
				</xsl:when>
				<xsl:when test="//sourceDesc/biblStruct/monogr[contains(@n,'book')]">
					<xsl:if test="//sourceDesc/biblStruct/monogr/author/text()">
						<xsl:value-of select="//sourceDesc/biblStruct/monogr/author" separator=" and "/>
						<xsl:text>, </xsl:text>
					</xsl:if>
					<em><xsl:value-of select="$title"/></em>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/pubPlace" separator="; "/>
					<xsl:text>: </xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/publisher" separator="; "/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct/monogr/imprint/date"/>
					<xsl:text>).</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<em><xsl:value-of select="//sourceDesc/biblStruct[@type='journal']//title"/></em>
					<xsl:if test="//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='vol']">													<xsl:text> </xsl:text><xsl:value-of select="//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='vol']"/>
					</xsl:if>
					<xsl:if test="//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='issue']">
						<xsl:text>, no. </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='issue']"/>
					</xsl:if>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//sourceDesc/biblStruct[@type='journal']//imprint/date"/>
					<xsl:text>)</xsl:text>
					<xsl:if test="//teiHeader//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='pages']">
						<xsl:text>: </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/biblStruct[@type='journal']//imprint/biblScope[@unit='pages']"/>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="normTitle">
			<xsl:choose>
				<xsl:when test="//teiHeader/fileDesc/titleStmt/title[(@type='normalized')]">
					<xsl:value-of select="//teiHeader/fileDesc/titleStmt/title[(@type='normalized')]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//teiHeader//sourceDesc/bibl/title[not(@type='alternative')]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- <xsl:variable name="subtitle">
			<xsl:choose>
				<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']"><span class="lead-in">Back to:</span><a href="/visual_materials.html#{$LEAP-ID}"><i class="fa-solid fa-lg fa-eye" aria-label="Visual Materials icon" aria-hidden="true"></i> <span>Visual Materials</span></a> <a href="#item-details" class="item-details-link"><i class="fa fa-lg fa-info-circle" aria-hidden="true"></i> <span>Item Details</span></a></xsl:when>
				<xsl:otherwise><span class="lead-in">Back to:</span><a href="/texts.html#{$LEAP-ID}"><i class="fa-solid fa-lg fa-map" aria-label="Recovered Texts icon" aria-hidden="true"></i> <span>Recovered Texts</span></a> <a href="#item-details" class="item-details-link"><i class="fa fa-lg fa-info-circle" aria-hidden="true"></i> <span>Item Details</span></a></xsl:otherwise>
			</xsl:choose>
		</xsl:variable> -->
		<xsl:variable name="subtitle-icon">
			<xsl:choose>
				<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">visual-material</xsl:when>
				<xsl:otherwise>recovered-text</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="editorial">
			<xsl:if test="count(//teiHeader//respStmt) > 1">
				<xsl:text>, eds. </xsl:text>
			</xsl:if>
			<xsl:if test="count(//teiHeader//respStmt) = 1">
				<xsl:text>, ed. </xsl:text>
			</xsl:if>
			<xsl:if test="count(//teiHeader//respStmt) = 0">
				<xsl:text>. </xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="edition">
			<xsl:if test="//teiHeader//publicationStmt/date[contains(text(), '2020')]">
				<xsl:text>site launch edition, 2020</xsl:text>
			</xsl:if>
			<xsl:if test="//teiHeader//publicationStmt/date[contains(text(), '2021')]">
				<xsl:text>new dawn edition, 2021</xsl:text>
			</xsl:if>
			<xsl:if test="//teiHeader//publicationStmt/date[contains(text(), '2022')]">
				<xsl:text>solidarity edition, 2022</xsl:text>
			</xsl:if>
			<xsl:if test="//teiHeader//publicationStmt/date[contains(text(), '2023')]">
				<xsl:text>solidarity edition, 2023</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="base-uri" select="base-uri(.)"/>
 		<xsl:variable name="filename" select="(tokenize($base-uri,'/'))[last()]"/>
		<xsl:variable name="custom-note">
			<xsl:apply-templates select="//encodingDesc/projectDesc/p/node()"/>
		</xsl:variable>
		<xsl:variable name="prod-note">
			<xsl:choose>
				<xsl:when test="//encodingDesc/projectDesc/p">
					<xsl:copy-of select="$custom-note"/>
				</xsl:when>
				<xsl:when test="//sourceDesc/biblStruct[@type='journal']">The editors produced this edition through a rigorous process that involved  using the following workflow: 1) Convert PDF of original document via OCR to Word; 2) Convert Word to XML; 3) Proofread XML against PDF of original document; and 4) Edit and encode XML using the <em>One More Voice</em><xsl:text> </xsl:text><a href="/pdf/OMV-Coding-Guidelines.pdf">coding guidelines</a> (PDF). However, users are encouraged to consult the original document if possible.</xsl:when>
				<xsl:otherwise>The editors produced this edition through a rigorous process that involved transcribing and encoding the text directly from images of the original document using the <em>One More Voice</em><xsl:text> </xsl:text><a href="/pdf/OMV-Coding-Guidelines.pdf">coding guidelines</a> (PDF). Users, however, are encouraged to consult the original document if possible.</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="warning">
			<xsl:choose>
				<xsl:when test="/TEI/text[contains(@n,'warning-violence')]"><aside class="warning-box violence"><strong class="site-red">Warning:</strong> Readers are advised to proceed with exceptional caution when consulting this document because it depicts situations involving graphic violence.</aside></xsl:when>
				<xsl:when test="/TEI/text[contains(@n,'warning-language')]"><aside class="warning-box language"><strong class="site-red">Warning:</strong> Readers are advised to proceed with exceptional caution when consulting this document because it contains highly-offensive, racially-charged language.</aside></xsl:when>
				<xsl:otherwise><aside class="warning-box">This historical item reflects the cultural beliefs and prejudices of its time and may contain material that will upset or distress some readers.</aside></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="text-object">
			<xsl:choose>
				<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
					<section id="transcription-switches" class="manuscript-switches">
						<label for="remove-color" class="md_switch" title="Color: On/Off">
							<xsl:text>Remove Color</xsl:text>
							<input type="checkbox" role="switch" data-toggle="button" aria-checked="true" aria-label="Toggle color" id="remove-color" checked="" />
							<span class="md_switch__toggle"></span>
					 	</label>
					 	<label for="invert" class="md_switch" title="Color Inversion: On/Off">
							<xsl:text>Invert</xsl:text>
							<input type="checkbox" role="switch" data-toggle="button" aria-checked="true" aria-label="Toggle color inversion" id="invert" checked="" />
							<span class="md_switch__toggle"></span>
					 	</label>
					 	<label for="remove-rotation" class="md_switch" title="Rotation: On/Off">
							<xsl:text>Remove Rotation</xsl:text>
							<input type="checkbox" role="switch" data-toggle="button" aria-checked="true" aria-label="Toggle rotation" id="remove-rotation" checked="" />
							<span class="md_switch__toggle"></span>
					 	</label>
				 	</section>
					<div data-include="empty-file">
						<style>.manuscript-switches{display:none !important;visibility:hidden !important}</style>
					</div>
					<section class="narrow-mobile" aria-labelledby="mobile">
						<p id="mobile">Please turn your mobile device to <span class="highlight">landscape</span> or <span class="highlight">widen your browser window</span> for optimal viewing of this archival document.</p>
					</section>
					<section class="manuscript">
						<div class="TEI front {$front}" style="{$body-color-front}" aria-labelledby="front-section">
							<div class="ms-container" id="front-section">
								<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
								<xsl:choose>
									<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:when test="$isPaged='false'">
										<xsl:apply-templates select="text/front"/>
									</xsl:when>
									<xsl:when test="//jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="text/front"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div class="TEI" style="{$body-color}">
							<div class="ms-container">
								<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
								<xsl:choose>
									<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:when test="$isPaged='false'">
										<xsl:apply-templates select="text/body"/>
									</xsl:when>
									<xsl:when test="//jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="text/body"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div class="TEI back {$back}" style="{$body-color-back}" aria-labelledby="back-section">
							<div class="ms-container" id="back-section">
								<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
								<xsl:choose>
									<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:when test="$isPaged='false'">
										<xsl:apply-templates select="text/back"/>
									</xsl:when>
									<xsl:when test="//jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="text/back"/>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</section>
				</xsl:when>
				<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
					<section id="transcription-switches" class="journal-switches">
					 	<label for="invert" class="md_switch" title="Color Inversion: On/Off">
							<xsl:text>Invert</xsl:text>
							<input type="checkbox" role="switch" data-toggle="button" aria-checked="true" aria-label="Toggle color inversion" id="invert" checked="" />
							<span class="md_switch__toggle"></span>
					 	</label>
					 	<label for="remove-justification" class="md_switch" title="Justification: On/Off">
							<xsl:text>Remove Justification</xsl:text>
							<input type="checkbox" role="switch" data-toggle="button" aria-checked="true" aria-label="Toggle rotation" id="remove-justification" checked="" />
							<span class="md_switch__toggle"></span>
					 	</label>
				 	</section>
					<div data-include="empty-file">
						<style>.journal-switches{display:none !important;visibility:hidden !important}</style>
					</div>
					<section class="narrow-mobile" aria-labelledby="mobile">
						<p id="mobile">Please turn your mobile device to <span class="highlight">landscape</span> or <span class="highlight">widen your browser window</span> for optimal viewing of this archival document.</p>
					</section>
					<xsl:variable name="narrow">
						<xsl:if test="//sourceDesc/biblStruct/monogr[contains(@n,'narrow')]">narrow</xsl:if>
					</xsl:variable>
					<section class="journal {$narrow}">
						<div class="TEI">
							<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
							<xsl:choose>
								<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
									<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
								</xsl:when>
								<xsl:when test="$isPaged='false'">
									<xsl:apply-templates select="text"/>
								</xsl:when>
								<xsl:when test="//jc:page[@n=$pagenumber]">
									<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="text"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</section>
				</xsl:when>
				<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">
					<section class="object">
						<div class="TEI">
							<div class="ms-container">
								<xsl:comment><xsl:value-of select="$isPaged"/></xsl:comment>
								<xsl:choose>
									<xsl:when test="$isPaged='true' and //jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:when test="$isPaged='false'">
										<xsl:apply-templates select="text/body"/>
									</xsl:when>
									<xsl:when test="//jc:page[@n=$pagenumber]">
										<xsl:apply-templates select="//jc:page[@n=$pagenumber]"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="text/body"/>
									</xsl:otherwise>
								</xsl:choose>
								<!-- <p class="image-enlarge">Click on image(s) to enlarge</p> -->
							</div>
						</div>
					</section>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="text-object-details">
			<h3 id="item-details">Item Details</h3>
			<xsl:choose>
				<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
					<p><strong>Author(s) &amp; contributor(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/></p>
					<p><strong>Date(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date" separator="; "/></p>
					<xsl:if test="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']">
						<p><strong>Place(s) of creation:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']" separator="; "/></p>
					</xsl:if>
					<p><strong>Form &amp; transmission history:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/history/p"/></p>
					<xsl:copy-of select="$object-description"/>
					<xsl:copy-of select="$repository"/>
					<xsl:copy-of select="$collection"/>
					<xsl:copy-of select="$shelfmark"/>
					<p><strong>Digital edition &amp; date:</strong><xsl:text> </xsl:text><a href="/index.html"><em><xsl:value-of select="//teiHeader//authority"/></em></a>, <xsl:value-of select="//teiHeader//publicationStmt/date"/></p>
					<p><strong>Critical editing &amp; encoding</strong><xsl:text>: </xsl:text> <xsl:value-of select="$encoding"/></p>
					<p><strong>Cite this digital edition (MLA)</strong><xsl:text>: </xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
					<xsl:value-of select="$additional-authors-2"/><xsl:value-of select="$period-after-name"/><xsl:text> “</xsl:text>
					<xsl:value-of select="$normTitle"/><xsl:text>” (</xsl:text><xsl:value-of select="//sourceDesc/bibl/date" separator="; "/><xsl:text>). </xsl:text><xsl:value-of select="$encoding"/><xsl:value-of select="$editorial"/>
					<em>One More Voice</em>, <xsl:value-of select="$edition"/>, <a href="/html/transcriptions/{substring-before($filename, '.xml')}.html">https://onemorevoice.org/html/transcriptions/<xsl:value-of select="substring-before($filename, '.xml')"/>.html</a>.</p>
					<p><strong>Rights:</strong><xsl:text> </xsl:text><xsl:copy-of select="$copyright"/></p>
					<!-- <p><strong>Unique page-visit stamp:</strong><xsl:text> </xsl:text><span id="page-visit">[Not shown because Javascript disabled]</span></p> -->
					<xsl:if test="//publicationStmt/ref">
						<xsl:variable name="source-link1">
							<xsl:value-of select="//publicationStmt/ref[1]/@target"/>
						</xsl:variable>
						<xsl:variable name="source-link2">
							<xsl:value-of select="//publicationStmt/ref[2]/@target"/>
						</xsl:variable>
						<p><strong>Explore complete/original item:</strong><xsl:text> </xsl:text><a aria-label="External Link" href="{$source-link1}"><xsl:value-of select="//publicationStmt/ref[1]"/></a>
						<xsl:if test="//publicationStmt/ref[2]">
							<xsl:text>; </xsl:text><a aria-label="External Link" href="{$source-link2}"><xsl:value-of select="//publicationStmt/ref[2]"/></a>
						</xsl:if>
						</p>
					</xsl:if>
					<p><strong>Accessibility:</strong><xsl:text> </xsl:text><em>One More Voice</em> digital facsimiles approximate the textual, structural, and material features of original documents. However, because such features may reduce accessibility, each facsimile allows users to toggle such features on and off as needed.</p>
					<p><strong>Production note</strong><xsl:text>: </xsl:text><xsl:copy-of select="$prod-note"/></p>
				</xsl:when>
				<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
					<p><strong>Author(s) &amp; contributor(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/></p>
					<p><strong>Date(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date" separator="; "/></p>
					<p><strong>Form &amp; transmission history:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/msDesc/history/p"/></p>
					<p><strong>Original publication details:</strong><xsl:text> </xsl:text><xsl:copy-of select="$pub-deets"/></p>
					<p><strong>Digital edition &amp; date:</strong><xsl:text> </xsl:text><a href="/index.html"><em><xsl:value-of select="//teiHeader//authority"/></em></a>, <xsl:value-of select="//teiHeader//publicationStmt/date"/></p>
					<p><strong>Critical editing &amp; encoding</strong><xsl:text>: </xsl:text> <xsl:value-of select="$encoding"/></p>
					<p><strong>Cite this digital edition (MLA)</strong><xsl:text>: </xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
					<xsl:value-of select="$additional-authors-2"/><xsl:value-of select="$period-after-name"/><xsl:text> “</xsl:text>
					<xsl:value-of select="$normTitle"/><xsl:text>” (</xsl:text><xsl:value-of select="//sourceDesc/bibl/date" separator="; "/><xsl:text>). </xsl:text><xsl:value-of select="$encoding"/><xsl:value-of select="$editorial"/>
					<em>One More Voice</em>, <xsl:value-of select="$edition"/>, <a href="/html/transcriptions/{substring-before($filename, '.xml')}.html">https://onemorevoice.org/html/transcriptions/<xsl:value-of select="substring-before($filename, '.xml')"/>.html</a>.</p>
					<p><strong>Rights:</strong><xsl:text> </xsl:text><xsl:copy-of select="$copyright"/></p>
					<!-- <p><strong>Unique page-visit stamp:</strong><xsl:text> </xsl:text><span id="page-visit">[Not shown because Javascript disabled]</span></p> -->
					<xsl:if test="//publicationStmt/ref">
						<xsl:variable name="source-link1">
							<xsl:value-of select="//publicationStmt/ref[1]/@target"/>
						</xsl:variable>
						<xsl:variable name="source-link2">
							<xsl:value-of select="//publicationStmt/ref[2]/@target"/>
						</xsl:variable>
						<p><strong>Explore complete/original item:</strong><xsl:text> </xsl:text><a aria-label="External Link" href="{$source-link1}"><xsl:value-of select="//publicationStmt/ref[1]"/></a>
						<xsl:if test="//publicationStmt/ref[2]">
							<xsl:text>; </xsl:text><a aria-label="External Link" href="{$source-link2}"><xsl:value-of select="//publicationStmt/ref[2]"/></a>
						</xsl:if>
						</p>
					</xsl:if>
					<p><strong>Accessibility:</strong><xsl:text> </xsl:text><em>One More Voice</em> digital facsimiles approximate the textual, structural, and material features of original documents. However, because such features may reduce accessibility, each facsimile allows users to toggle such features on and off as needed.</p>
					<p><strong>Production note</strong><xsl:text>: </xsl:text><xsl:copy-of select="$prod-note"/></p>
				</xsl:when>
				<xsl:when test="//sourceDesc/msDesc[@type='object-archive']">
					<p><strong>Creator(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/></p>
					<p><strong>Date(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date" separator="; "/></p>
					<xsl:if test="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']">
						<p><strong>Place(s) of creation:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']" separator="; "/></p>
					</xsl:if>
					<xsl:copy-of select="$repository"/>
					<xsl:copy-of select="$collection"/>
					<xsl:copy-of select="$shelfmark"/>
					<p><strong>Digital edition &amp; date:</strong><xsl:text> </xsl:text><a href="/index.html"><em><xsl:value-of select="//teiHeader//authority"/></em></a>, <xsl:value-of select="//teiHeader//publicationStmt/date"/></p>
					<p><strong>Digital object curation</strong><xsl:text>: </xsl:text> <xsl:value-of select="$encoding"/></p>
					<p><strong>Cite this digital edition (MLA)</strong><xsl:text>: </xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
					<xsl:value-of select="$additional-authors-2"/><xsl:value-of select="$period-after-name"/><xsl:text> “</xsl:text>
					<xsl:value-of select="$normTitle"/><xsl:text>” (</xsl:text><xsl:value-of select="//sourceDesc/bibl/date" separator="; "/><xsl:text>). </xsl:text><!--<xsl:value-of select="$encoding"/><xsl:value-of select="$editorial"/>-->
					<em>One More Voice</em>, <xsl:value-of select="$edition"/>, <a href="/html/transcriptions/{substring-before($filename, '.xml')}.html">https://onemorevoice.org/html/transcriptions/<xsl:value-of select="substring-before($filename, '.xml')"/>.html</a>.</p>
					<p><strong>Rights:</strong><xsl:text> </xsl:text><xsl:copy-of select="$copyright"/></p>
					<!-- <p><strong>Unique page-visit stamp:</strong><xsl:text> </xsl:text><span id="page-visit">[Not shown because Javascript disabled]</span></p> -->
					<xsl:if test="//publicationStmt/ref">
						<xsl:variable name="source">
							<xsl:for-each select="//publicationStmt/ref">
								<xsl:variable name="link" select="@target"/>
								<xsl:variable name="source" select="node()"/>
								<a aria-label="External Link" href="{$link}"><xsl:value-of select="$source"/></a>
							 	<xsl:if test="position() != last()">
									<xsl:text>; </xsl:text>
							 	</xsl:if>
							</xsl:for-each>
						</xsl:variable>
							<!--<xsl:variable name="link">
								<xsl:value-of select="@target"/>
							</xsl:variable>
							<a href="{$link}"><xsl:value-of select="" separator="; "/></a>
						</xsl:variable>-->
						<p><strong>Explore complete/original item:</strong><xsl:text> </xsl:text><xsl:copy-of select="$source"/></p>
					</xsl:if>					
				</xsl:when>
				<xsl:when test="//sourceDesc/biblStruct[@type='object-book-journal']">
					<xsl:variable name="image"><xsl:value-of select="//text//figure[@facs]"/></xsl:variable>
					<p><strong>Creator(s) &amp; contributor(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//titleStmt/author[@role='first-normalized']"/><xsl:value-of select="$additional-authors-1"/></p>
					<p><strong>Date(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date" separator="; "/></p>
					<xsl:if test="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']">
						<p><strong>Place(s) of creation:</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/placeName[@type='compositionPlace']" separator="; "/></p>
					</xsl:if>
					<p><strong>Original publication details:</strong><xsl:text> </xsl:text><xsl:copy-of select="$pub-deets"/></p>
					<p><strong>Digital edition &amp; date:</strong><xsl:text> </xsl:text><a href="/index.html"><em><xsl:value-of select="//teiHeader//authority"/></em></a>, <xsl:value-of select="//teiHeader//publicationStmt/date"/></p>
					<p><strong>Digital object curation</strong><xsl:text>: </xsl:text> <xsl:value-of select="$encoding"/></p>
					<p><strong>Cite this digital edition (MLA)</strong><xsl:text>: </xsl:text>
					<xsl:value-of select="//teiHeader//titleStmt/author[@role='first']"/>
					<xsl:value-of select="$additional-authors-2"/><xsl:value-of select="$period-after-name"/><xsl:text> “</xsl:text>
					<xsl:value-of select="$normTitle"/><xsl:text>” (</xsl:text><xsl:value-of select="//sourceDesc/bibl/date" separator="; "/><xsl:text>). </xsl:text><!--<xsl:value-of select="$encoding"/><xsl:value-of select="$editorial"/>-->
					<em>One More Voice</em>, <xsl:value-of select="$edition"/>, <a href="/html/transcriptions/{substring-before($filename, '.xml')}.html">https://onemorevoice.org/html/transcriptions/<xsl:value-of select="substring-before($filename, '.xml')"/>.html</a>.</p>
					<p><strong>Rights:</strong><xsl:text> </xsl:text><xsl:copy-of select="$copyright"/></p>
					<!-- <p><strong>Unique page-visit stamp:</strong><xsl:text> </xsl:text><span id="page-visit">[Not shown because Javascript disabled]</span></p> -->
					<xsl:if test="//publicationStmt/ref">
						<xsl:variable name="source">
							<xsl:for-each select="//publicationStmt/ref">
								<xsl:variable name="link" select="@target"/>
								<xsl:variable name="source" select="node()"/>
								<a aria-label="External Link" href="{$link}"><xsl:value-of select="$source"/></a>
							 	<xsl:if test="position() != last()">
									<xsl:text>; </xsl:text>
							 	</xsl:if>
							</xsl:for-each>
						</xsl:variable>
							<!--<xsl:variable name="link">
								<xsl:value-of select="@target"/>
							</xsl:variable>
							<a href="{$link}"><xsl:value-of select="" separator="; "/></a>
						</xsl:variable>-->
						<p><strong>Explore complete/original item:</strong><xsl:text> </xsl:text><xsl:copy-of select="$source"/></p>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<main id="main" aria-labelledby="item-title">
			<section class="text-object">
				<h2 id="item-title"><xsl:value-of select="//teiHeader//titleStmt/title[1]"/></h2>
				<!-- <p class="associated-links {$subtitle-icon}"><xsl:copy-of select="$subtitle"/></p> -->
				<p class="associated-links {$subtitle-icon}"><a href="#item-details" class="item-details-link"><i class="fa fa-lg fa-info-circle" aria-hidden="true"></i> <span>Item Details</span></a></p>
				<xsl:copy-of select="$warning"/>
				<xsl:copy-of select="$text-object"/>
			</section>
			<section class="text-object-details">
				<xsl:copy-of select="$text-object-details"/>
			</section>
		</main>
	</xsl:template>

	<!-- General match -->
	<xsl:template match="*" priority="-10">
		<xsl:variable name="class">
			<xsl:if test="@rend">
				<xsl:value-of select="translate(@rend, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="@place">
				<xsl:value-of select="translate(@place, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="@type">
				<xsl:value-of select="translate(@type, '-', '')"/>
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="title">
			<xsl:for-each select="@*">
				<xsl:sort/>
				<xsl:if test="not(name()='status')">
					<xsl:value-of select="concat(name(),': ', ., '; ')"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<span>
			<xsl:if test="$class/text()">
				<xsl:attribute name="class">
					<xsl:value-of select="$class"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:copy-of select="jc:addFE(.)"/>
		</span>
	</xsl:template>
	
	<!-- Make rend classes -->
	<xsl:template match="*/@rend" priority="-1">
		<xsl:attribute name="class">
			<xsl:value-of select="concat(parent::node()/name(), ' ')"/>
			<xsl:value-of select="translate(., '-', '')"/>
		</xsl:attribute>
	</xsl:template>
	
	<!-- Textual divisions -->
	<xsl:template match="text|body|front|back">
		<div class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''))}">
			<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
		</div>
	</xsl:template>

	<xsl:template match="div">
		<div class="{concat(name(), ' ', @rend, ' ', @n)}">
			<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
		</div>
	</xsl:template>

	<xsl:template match="lg">
		<xsl:choose>
			<xsl:when test="@type='verse'">
				<div class="poem-wrapper">
					<div class="{concat('poem', ' ', @type, ' ', @rend, ' ', @n)}">
						<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
					</div>
				</div>
			</xsl:when>
			<xsl:when test="@type='stanza'">
				<p class="{concat('poetic-section', ' ', @type, ' ', @rend, ' ', @n)}">
					<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
				</p>
			</xsl:when>
			<xsl:otherwise>
				<div class="{concat('poem', ' ', @type, ' ', @rend, ' ', @n)}">
					<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
				</div>
			</xsl:otherwise>	
		</xsl:choose>
	</xsl:template>

	<xsl:template match="l">
		<seg class="{concat('poetic-line', ' ', @type, ' ', @rend, ' ', @n)}">
			<xsl:copy-of select="jc:addFE(.)"/>
		</seg>
	</xsl:template>

	<xsl:template match="lb">
			<br/>
		<!--<xsl:variable name="num">
			<xsl:number level="any" from="pb"/>
		</xsl:variable>
		<xsl:if test="number($num) mod 5 =0">
			<span class="linenumber">
				<xsl:value-of select="$num"/>
			</span>
		</xsl:if>-->
	</xsl:template>

	<!-- Alphabetical list of elements. Alphabetized by last element in path *or* first element among options. -->

	<xsl:template match="ab|p">
		<p class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''))}">
			<xsl:copy-of select="jc:addFE(.)"/>
		</p>
	</xsl:template>

	<xsl:template match="abbr">
		<abbr><xsl:copy-of select="jc:addFE(.)"/></abbr>
	</xsl:template>

	<xsl:template match="add">
		<ins class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''), ' ', translate(@n, '-', ''))}"><xsl:copy-of select="jc:addFE(.)"/></ins>
	</xsl:template>

	<xsl:template match="add[@place='over-text']">
		<ins class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))}" title="Addition written over existing text"><xsl:copy-of select="jc:addFE(.)"/></ins>
		<!--<ins class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))} tooltip-container">
			<span aria-label="Addition written over existing text" aria-describedby="add-over-text" data-tooltip-trigger="">
				<xsl:copy-of select="jc:addFE(.)"/>
			</span>
			<span id="add-over-text" role="tooltip" class="hidden">Addition written over existing text</span>
		</ins>-->
	</xsl:template>

	<xsl:template match="tei:addSpan[preceding-sibling::node()[1][name()='p']]|tei:addSpan[preceding-sibling::node()[2][name()='p']]|p/addSpan">
		<br/>
		<xsl:copy-of select="jc:addFE(.)"/>
	</xsl:template>

	<!-- app: show first rdg, offer alternatives in tooltip -->
	<xsl:template match="app">
		<xsl:variable name="rdg-rdg">
			<xsl:value-of select="../app/rdg" separator=" [or] "/>
		</xsl:variable>
		<span class="app">
			<xsl:attribute name="title">This passage can be read in alternate ways: <xsl:value-of select="$rdg-rdg"/></xsl:attribute>
			<xsl:apply-templates select="rdg[1]"/>
		</span>
		<!-- <span class="app tooltip-container">
			<span aria-label="Alternate reading" aria-describedby="alternate-reading" data-tooltip-trigger="">
				<xsl:apply-templates select="rdg[1]"/>
			</span>
			<span id="alternate-reading" role="tooltip" class="hidden">This passage can be read in alternate ways:  <xsl:value-of select="$rdg-rdg"/></span>
		</span>-->
	</xsl:template>

	<xsl:template match="cb">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="choice">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="choice/sic">
			<xsl:variable name="choice-orig-sic">
				<xsl:choose>
					<!-- If there are orig and reg values in the corr, show the orig -->
					<xsl:when test="../corr/choice/orig">
						<xsl:value-of select="../corr/choice/orig"/>
					</xsl:when>
					<!-- If there are sic and corr values in the corr, show both sic and corr -->
					<xsl:when test="../corr/choice/sic">
						<xsl:value-of select="../corr/choice/sic"/> [or] <xsl:value-of select="../corr/choice/corr"/>
					</xsl:when>
					<!-- If there are two rdgs, show both rdgs -->
					<xsl:when test="../corr/app/rdg">
						<xsl:value-of select="../corr/app/rdg[1]"/> [or] <xsl:value-of select="../corr/app/rdg[2]"/>
					</xsl:when>
					<xsl:when test="../corr[not(text())]">[no text]</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="../corr"/>
					</xsl:otherwise>
				</xsl:choose>			
			</xsl:variable>
			<u class="sic diplomatic">
				<xsl:attribute name="title">The editors suggest a correction as follows: <xsl:value-of select="$choice-orig-sic"/></xsl:attribute>
				<xsl:apply-templates/>
			</u>
			<!-- <u class="sic diplomatic tooltip-container">
                <span aria-label="Correction" aria-describedby="correction" data-tooltip-trigger="">
					<xsl:apply-templates/>
                </span>
                <span id="correction" role="tooltip" class="hidden">The editors suggest a correction as follows: <xsl:value-of select="$choice-orig-sic"/></span>
			</u> -->
	</xsl:template>

	<xsl:template match="corr|expan|reg"/>

	<xsl:template match="date">
		<!--<time><xsl:apply-templates/></time>-->
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="del">
		<del class="del cancelled">
			<xsl:apply-templates/>
		</del>
	</xsl:template>

	<xsl:template match="del[following-sibling::add[1][@place='over-text']]" priority="10">
		<del class="del-by-over-text" title="Text deleted by over-writing"><xsl:apply-templates/></del>
		<!-- <del class="del-by-over-text tooltip-container">
			<span aria-label="Text deleted by overwriting" aria-describedby="text-deleted-by-overwriting" data-tooltip-trigger="">
			<xsl:apply-templates/>
			</span>
			<span id="text-deleted-by-overwriting" role="tooltip" class="hidden">Text deleted by over-writing</span>
		</del>-->
	</xsl:template>

	<xsl:template match="figure">
		<!-- start of variables -->
		<xsl:variable name="figure-facs">
			<xsl:apply-templates select="self::node()/@facs"/>
		</xsl:variable>
		<xsl:variable name="graphic-url">
			<xsl:apply-templates select="self::node()/graphic/@url"/>
		</xsl:variable>
		<xsl:variable name="graphic-facs">
			<xsl:apply-templates select="self::node()/graphic/@facs"/>
		</xsl:variable>
		<xsl:variable name="graphic-n">
			<xsl:apply-templates select="self::node()/graphic/@n"/>
		</xsl:variable>
		<xsl:variable name="altText">
			<xsl:apply-templates select="self::node()/figDesc"/>
		</xsl:variable>
		<!-- This variable creates the title for the object image. -->
		<xsl:variable name="caption">
			<xsl:variable name="copyright">
				<xsl:if test="//availability/licence[@target]">
					<xsl:text> (</xsl:text><xsl:value-of select="//availability/licence/@target"/><xsl:text>).</xsl:text>
				</xsl:if>
			</xsl:variable>
			<xsl:value-of select="self::node()/label"/><xsl:text>. </xsl:text><xsl:value-of select="//availability/p"/><xsl:text> </xsl:text><xsl:value-of select="//availability/licence"/><xsl:value-of select="$copyright"/>
		</xsl:variable>
		<xsl:variable name="rotate-id">
			<xsl:if test="self::node()[@n='hist-object' and @change='rotate-90']">
				<xsl:text>image-to-rotate</xsl:text>
			</xsl:if>
			<xsl:if test="self::node()[@n='hist-object' and @change='rotate-180']">
				<xsl:text>image-to-rotate</xsl:text>
			</xsl:if>
		</xsl:variable>
		<!-- The prior variable creates a static id for all images to be rotated. This is not an ideal solution and needs to be improved down the road because, if there are two object images in the same document that both need to rotated, they will both get the same id. However, The following code, if used in place of <xsl:text>image-to-rotate</xsl:text> above, gives each image to be rotated a unique id based on its page number(s). This could be the way to a better solution, but would involved working out the Javascript to select that same id.-->
		<!-- <xsl:value-of select="/TEI/text/body/div/p/figure/graphic/@*[namespace-uri()='http://www.w3.org/XML/1998/namespace' and local-name()='id']"/> -->
		<!-- end of variables -->
		<xsl:choose>
			<!-- This option used for object images that can be rotated -->
			<xsl:when test="contains(@n,'hist-object') and contains(@change,'rotate-90') or contains(@change,'rotate-180')">
				<!--<br/><br/><br/>-->
				<span class="{concat(name(), ' ', @rend, ' ', @n)}"  id="{$rotate-id}">
					<a href="{$figure-facs}">	
						<img loading="lazy" src="{$graphic-url}" srcset="{$graphic-facs}" sizes="{$graphic-n}" alt="{$altText}" title="{normalize-space($caption)}"/>
						<div class="image-overlay"></div>
					</a>
				</span>
				<!-- Button/rotation functionality adapted from https://www.w3schools.com/howto/howto_js_toggle_class.asp and https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/Switch_role -->
				<button role="switch" aria-checked="false" aria-label="Rotate image" id="rotate-button" onclick="myFunction()">Rotate <i class="fa fa-repeat" aria-hidden="true"></i></button>
				<div data-include="empty-file">
					<style>#rotate-button{display: none !important;visibility: hidden !important;}</style>
				</div>
				<!--<div class="download"><div><a href="{$graphic-url}" download="">Download Image (JPEG) <i class="fa fa-arrow-down fa-.8x" title="Download Image (JPEG)"></i></a></div></div>-->
			</xsl:when>
			<!-- This option used for all other object images -->
			<xsl:when test="contains(@n,'hist-object')">
				<span class="{concat(name(), ' ', @rend, ' ', @n)}">
					<a href="{$figure-facs}">	
						<img loading="lazy" src="{$graphic-url}" srcset="{$graphic-facs}" sizes="{$graphic-n}" alt="{$altText}" title="{normalize-space($caption)}"/>
						<div class="image-overlay"></div>
					</a>
				</span>
				<!--<div class="download"><div><a href="{$graphic-url}" download="">Download Image (JPEG) <i class="fa fa-arrow-down fa-.8x" title="Download Image (JPEG)"></i></a></div></div>-->
			</xsl:when>
			<!-- The following used for images in TEI files. -->
			<xsl:when test="'[child::graphic]'">
				<span class="{concat(name(), ' ', @rend, ' ', @n)}"><img loading="lazy" src="{$graphic-url}" srcset="{$graphic-facs}" sizes="{$graphic-n}" alt="{$altText}"/></span>
			</xsl:when>
			<xsl:otherwise>
				<span class="{concat(name(), ' ', @rend, ' ', @n)}">{figure}</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- An undefined foreign word. -->
	<xsl:template match="foreign[not(term[@xml:lang])]">
		<xsl:copy-of select="jc:addFE(.)"/>
	</xsl:template>

	<xsl:template match="fw|fw[@type='catch']">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}">
			<xsl:copy-of select="jc:addFE(.)"/>
		</span>
	</xsl:template>

	<xsl:template match="gap[@extent][@unit]" priority="10">
		<xsl:choose>
			<xsl:when test="@unit='chars'"><span class="gap" title="{concat('Gap, extent: ', @extent, ' ', @unit, '; reason: ', @agent)}">[<xsl:for-each select="1 to @extent">&#x00A0;</xsl:for-each>]</span></xsl:when>
			<xsl:when test="@unit='words'"><span class="gap" title="{concat('Gap, extent: ', @extent, ' ', @unit, '; reason: ', @agent)}">[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>]</span></xsl:when>
			<xsl:when test="@unit='lines'"><span class="gap" title="{concat('Gap, extent: ', @extent, ' ', @unit, '; reason: ', @agent)}">[&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;]</span></xsl:when>
			<xsl:when test="@unit='pages'"><span class="gap" title="{concat('Gap, extent: ', @extent, ' ', @unit, '; reason: ', @agent)}">[&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;]</span></xsl:when>
			<xsl:otherwise><span class="gap" title="{concat('Gap, extent: ', @extent, ' ', @unit, 'reason: ', @agent)}">[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>]</span></xsl:otherwise>
		</xsl:choose>
		<!--<xsl:choose>
			<xsl:when test="@unit='chars'">
				<span class="gap tooltip-container">
					<span aria-label="Gap in text" aria-describedby="gap-in-text" data-tooltip-trigger="">[<xsl:for-each select="1 to @extent">&#x00A0;</xsl:for-each>]</span>
					<span id="gap-in-text" role="tooltip" class="hidden"><xsl:value-of select="concat('Gap; extent: ', @extent, ' ', @unit, '; reason: ', @agent)"/></span>
				</span>
			</xsl:when>
			<xsl:when test="@unit='words'">
				<span class="gap tooltip-container">
					<span aria-label="Gap in text" aria-describedby="gap-in-text" data-tooltip-trigger="">[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>]</span>
					<span id="gap-in-text" role="tooltip" class="hidden"><xsl:value-of select="concat('Gap; extent: ', @extent, ' ', @unit, '; reason: ', @agent)"/></span>
				</span>
			</xsl:when>
			<xsl:when test="@unit='lines'">
				<span class="gap tooltip-container">
					<span aria-label="Gap in text" aria-describedby="gap-in-text" data-tooltip-trigger="">[&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;]</span>
					<span id="gap-in-text" role="tooltip" class="hidden"><xsl:value-of select="concat('Gap; extent: ', @extent, ' ', @unit, '; reason: ', @agent)"/></span>
				</span>
			</xsl:when>
			<xsl:when test="@unit='pages'">
				<span class="gap tooltip-container">
					<span aria-label="Gap in text" aria-describedby="gap-in-text" data-tooltip-trigger="">[&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;]</span>
					<span id="gap-in-text" role="tooltip" class="hidden"><xsl:value-of select="concat('Gap; extent: ', @extent, ' ', @unit, '; reason: ', @agent)"/></span>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="gap tooltip-container">
					<span aria-label="Gap in text" aria-describedby="gap-in-text" data-tooltip-trigger="">[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>]</span>
					<span id="gap-in-text" role="tooltip" class="hidden"><xsl:value-of select="concat('Gap; extent: ', @extent, ' ', @unit, '; reason: ', @agent)"/></span>
				</span>
			</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>

	<!-- do not show graphic -->
	<xsl:template match="graphic"/>

	<xsl:template match="head">
		<xsl:choose>
			<xsl:when test="@type='subheading'">
				<h4 class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place, ' ', @n)}">
					<xsl:copy-of select="jc:addFE(.)"/>
				</h4>
			</xsl:when>
			<xsl:otherwise>
				<h3 class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place, ' ', @n)}">
					<xsl:copy-of select="jc:addFE(.)"/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="//availability//hi">
		<span class="{concat(translate(@rend, '-', ''), ' ', translate(@n, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="idno[@type='LEAP-ID']">
		<span class="idno"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="item">
		<li class="{concat(name(), ' ', @type, ' ', @rend, ' ', @n)}">
			<xsl:copy-of select="jc:addFE(.)"/>
		</li>
	</xsl:template>

	<xsl:template match="list">
		<!--<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}" title="list">
			<xsl:copy-of select="jc:addFE(.)"/>
		</span>-->
		<xsl:if test="@type='ordered'">
			<ol class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place)}">
				<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
			</ol>
		</xsl:if>
		<xsl:if test="@type='unordered'">
			<ul class="{concat(name(), ' ', @type, ' ', @rend, ' ', @n)}">
				<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
			</ul>
		</xsl:if>
	</xsl:template>

	<xsl:template match="metamark">
		<span class="metamark {@rend} {@function} {@place}" title="Editorial symbol, mark, or unusual character">#</span>
		<!-- <span class="metamark {@rend} {@function} {@place}  tooltip-container">
			<span aria-label="Editorial symbol, mark, or unusual character" aria-describedby="editorial-symbol" data-tooltip-trigger="">
				#
			</span>
			<span id="editorial-symbol" role="tooltip" class="hidden">Editorial symbol, mark, or unusual character</span>
		</span> -->
	</xsl:template>

	<xsl:template match="add[@place='marginleft']/metamark|add[@place='marginright']/metamark" priority="10">
		<ins class="metamark {@rend} {@function} {@place}" title="Editorial symbol, mark, or unusual character">#</ins>
		<!-- <ins class="metamark {@rend} {@function} {@place} tooltip-container">
			<span aria-label="Editorial symbol, mark, or unusual character" aria-describedby="editorial-symbol" data-tooltip-trigger="">
				#
			</span>
			<span id="editorial-symbol" role="tooltip" class="hidden">Editorial symbol, mark, or unusual character</span>
		</ins> -->
	</xsl:template>

	<xsl:template match="milestone">
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<xsl:choose>
					<xsl:when test="contains(@rend,'double-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'line', ' ', 'first-double')}"/>
					</xsl:when>
					<xsl:when test="contains(@rend,'triple-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'third-line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'third-line')}"/>
					</xsl:when>
					<xsl:otherwise>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''))}"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<xsl:choose>
					<xsl:when test="contains(@rend,'double-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'line', ' ', 'first-double')}"/>
					</xsl:when>
					<xsl:when test="contains(@rend,'triple-line')">
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'third-line')}"/>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''), ' ', 'third-line')}"/>
					</xsl:when>
					<xsl:otherwise>
						<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@n, '-', ''))}"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="note">
		<span class="{concat(name(), ' ', @type, ' ', @rend, ' ', @place, ' ', @n)}"><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="orig">
		<xsl:copy-of select="jc:addFE(.)"/>
	</xsl:template>

	<xsl:template match="orgName">
		<span class="orgName"><xsl:attribute name="title">A formally-named group or organization.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="text/body/div[1]/pb[1]|text/front/div[1]/pb[1]|text/back/div[1]/pb[1]" priority="10">
		<span class="pb-title">
			<xsl:value-of select="@n"/>
		</span>
	</xsl:template>

	<xsl:template match="pb[@type='blank']">
		<br/>
		<span class="pb-title">
			<xsl:value-of select="@n"/>
		</span>
		<span class="blank">&lt;This page is blank in the original manuscript.&gt;</span>
		<!-- Adds appropriate number of empty lines on a blank page -->
		<!--<xsl:for-each select="1 to @ana"><br/></xsl:for-each>-->
	</xsl:template>

	<xsl:template match="pb">
		<xsl:choose>
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']">
				<br/>
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
			</xsl:when>
			<xsl:when test="//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">
				<!--<br/>-->
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="jc:page">
		<xsl:choose> 
			<xsl:when test="//sourceDesc/msDesc[@type='manuscript']|//sourceDesc/msDesc[@type='object-archive']|//sourceDesc/biblStruct[@type='object-book-journal']">
			<div class="page">
				<!--<br/>-->
				<span class="pb-title">
					<xsl:value-of select="@n"/>
				</span>
				<xsl:copy-of select="jc:addFE(.)"/>
			</div>
			</xsl:when>
			<xsl:when test="//sourceDesc/biblStruct[@type='journal']">
				<div class="page">
					<span class="pb-title">
						<xsl:value-of select="@n"/>
					</span>
					<xsl:copy-of select="jc:addFE(.)"/>
				</div>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="persName">
		<span class="persName"><xsl:attribute name="title">A formally-named person.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

<!-- placeNames -->

	<xsl:template match="placeName">
		<span class="placeName"><xsl:attribute name="title">A formally-named place.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="geogName">
		<span class="geogName"><xsl:attribute name="title">A formally-named geographical entity.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<!--<xsl:template match="bloc">
		<span class="bloc"><xsl:attribute name="title">A multinational entity, usually continents.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>-->

	<!--<xsl:template match="country">
		<span class="country"><xsl:attribute name="title">A country.</xsl:attribute><xsl:apply-templates/></span>
	</xsl:template>-->

	<xsl:template match="region">
		<span class="region"><xsl:attribute name="title">A formally-named region.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="bloc">
		<span class="bloc"><xsl:attribute name="title">A multinational entity, usually a continent.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="settlement">
		<span class="settlement"><xsl:attribute name="title">A settlement, such as a state, city, town, or village.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="country">
		<span class="country"><xsl:attribute name="title">A country.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

<!-- end placeNames -->

	<xsl:template match="//encodingDesc/projectDesc//ref[@target]">
		<xsl:variable name="link">
			<xsl:value-of select="@target"/>
		</xsl:variable>
		<a href="{$link}"><xsl:apply-templates/></a>
	</xsl:template>

	<xsl:template match="//fileDesc/publicationStmt/availability/p/ref[@target]">
		<xsl:variable name="aria-label">
			<xsl:if test="starts-with(@target, 'mailto')">External Client</xsl:if>
			<xsl:if test="starts-with(@target, 'http')">External Link</xsl:if>
		</xsl:variable>
		<xsl:variable name="link">
			<xsl:value-of select="@target"/>
		</xsl:variable>
		<a aria-label="{$aria-label}" href="{$link}"><xsl:apply-templates/></a>
	</xsl:template>

	<xsl:template match="rdg">
		<xsl:copy-of select="jc:addFE(.)"/>
	</xsl:template>

	<xsl:template match="seg">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@type, '-', ''), ' ', translate(@n, '-', ''))}"><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="space[@extent][@unit]" priority="10">
		<xsl:choose>
			<xsl:when test="@unit='chars'">
				<span class="space">
					<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;</xsl:for-each>
				</span>
			</xsl:when>
			<xsl:when test="@unit='words'">
				<span class="space">
					<xsl:for-each select="1 to @extent"
						>&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;&#x00A0;</xsl:for-each>
				</span>
			</xsl:when>
			<xsl:when test="@dim='vertical'">
				<!-- Adds empty space at the end of pages OMV -->
				<!--<xsl:for-each select="1 to @extent"><br/></xsl:for-each>-->
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<span class="space-other">
					[<xsl:for-each select="1 to @extent">&#x00A0;&#x00A0;</xsl:for-each>]</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="subst">
		<xsl:copy-of select="jc:addFE(.)"/>
	</xsl:template>

	<xsl:template match="supplied">	
		<span class="supplied"><xsl:attribute name="title">Text supplied because the original text is illegible, not visible, or missing.</xsl:attribute><xsl:text>[</xsl:text><xsl:copy-of select="jc:addFE(.)"/><xsl:text>]</xsl:text>
		</span>
		<!-- <span class="supplied tooltip-container">
			<span aria-label="Supplied text" aria-describedby="supplied-text" data-tooltip-trigger="">
				<xsl:text>[</xsl:text><xsl:copy-of select="jc:addFE(.)"/><xsl:text>]</xsl:text>
			</span>
			<span id="supplied-text" role="tooltip" class="hidden">Text supplied because the original text is illegible, not visible, or missing</span>
		</span> -->
	</xsl:template>
	
	<!-- Beginning of elements that go with table -->
	<xsl:template match="table">
		<table class="{concat(name(), ' ', @rend, ' ', @n)}">
			<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
		</table>
	</xsl:template>

	<xsl:template match="row">
		<tr class="{concat(name(), ' ', @rend, ' ', @n)}">
			<xsl:copy-of select="jc:addFE(.)"/><!-- remove? -->
		</tr>
	</xsl:template>

	<xsl:template match="cell">
		<td class="{concat(name(), ' ', @rend, ' ', @n)}"><xsl:copy-of select="jc:addFE(.)"/></td>
	</xsl:template>
	<!-- Non-breaking space &#x00A0; -->

	<xsl:template match="term[@type]" priority="1">
		<xsl:copy-of select="jc:addFE(.)"/>
	</xsl:template>

	<xsl:template match="term[@type='collective']" priority="10">
		<span class="collective"><xsl:attribute name="title">A collective term that signifies an individual or plural entity.</xsl:attribute><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<xsl:template match="unclear">
		<span class="unclear">
				<xsl:choose>
					<xsl:when test="@cert">
						<xsl:attribute name="title">
							<xsl:value-of select="concat('Text ', name(), '; certainty of transcription: ', @cert)"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="title">
							<xsl:value-of select="concat('Text ', name())"/>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			<xsl:apply-templates select="node()"/>
		</span>
		<!-- <xsl:variable name="unclear-cert">
			<xsl:choose>
				<xsl:when test="@cert">
					<xsl:value-of select="concat('Text unclear; certainty of transcription: ', @cert)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Text unclear</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<span class="unclear tooltip-container">
			<span aria-label="Text unclear" aria-describedby="text-unclear" data-tooltip-trigger="">
				<xsl:apply-templates select="node()"/>
			</span>
            <span id="text-unclear" role="tooltip" class="hidden"><xsl:value-of select="$unclear-cert"/></span>
		</span> -->
	</xsl:template>

	<xsl:template match="w">
		<span class="word"><xsl:copy-of select="jc:addFE(.)"/></span>
	</xsl:template>

	<!-- function added by James Cummings 2021-04 -->
	<!-- jc:addFormattingElements => jc:addFE -->
	
	<xsl:function name="jc:addFE" as="item()*">
		<xsl:param name="current" as="node()"></xsl:param>
		<xsl:variable name="rend" select="$current/@rend"/>
		<xsl:choose>
			<xsl:when test="contains($rend, 'bold') or contains($rend, 'italic')">
				<xsl:choose>
					<xsl:when test="contains($rend, 'bold') and contains($rend, 'italic')">
						<strong><em><xsl:apply-templates select="$current/node()"/></em></strong>
					</xsl:when>
					<xsl:when test="contains($rend, 'bold')">
						<strong><xsl:apply-templates select="$current/node()"/></strong>
					</xsl:when>
					<xsl:when test="contains($rend, 'italic')">
						<em><xsl:apply-templates select="$current/node()"/></em>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$current/node()"/>		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>


	<!-- ******************* -->

	<!-- Removed from <xsl:function name="jc:addFE" as="item()*"> -->
	<!--<xsl:when test="contains($rend, 'sup')
		or contains($rend, 'bold') or contains($rend, 'italic')">
		<xsl:choose>
			<xsl:when test="contains($rend, 'bold') and contains($rend, 'italic') and contains($rend, 'sup')">
				<xsl:attribute name="aria-label">Bold, italic, and superscript</xsl:attribute>
				<strong><em><sup><xsl:apply-templates select="$current/node()"/></sup></em></strong>
			</xsl:when>
			<xsl:when test="contains($rend, 'bold') and contains($rend, 'sup')">
				<xsl:attribute name="aria-label">Bold and superscript</xsl:attribute>
				<strong><sup><xsl:apply-templates select="$current/node()"/></sup></strong>
			</xsl:when>
			<xsl:when test="contains($rend, 'italic') and contains($rend, 'sup')">
				<xsl:attribute name="aria-label">Italic and superscript</xsl:attribute>
				<em><sup><xsl:apply-templates select="$current/node()"/></sup></em>
			</xsl:when>
			<xsl:when test="contains($rend, 'bold') and contains($rend, 'italic')">
				<xsl:attribute name="aria-label">Bold and italic</xsl:attribute>
				<strong><em><xsl:apply-templates select="$current/node()"/></em></strong>
			</xsl:when>
			<xsl:when test="contains($rend, 'sup')">
				<xsl:attribute name="aria-label">Superscript</xsl:attribute>
				<sup><xsl:apply-templates select="$current/node()"/></sup>
			</xsl:when>
			<xsl:when test="contains($rend, 'bold')">
				<xsl:attribute name="aria-label">Bold</xsl:attribute>
				<strong><xsl:apply-templates select="$current/node()"/></strong>
			</xsl:when>
			<xsl:when test="contains($rend, 'italic')">
				<xsl:attribute name="aria-label">Italic</xsl:attribute>
				<em><xsl:apply-templates select="$current/node()"/></em>
			</xsl:when>
		</xsl:choose>
	</xsl:when>-->

	<!-- Removed from <xsl:template match="TEI">-->
	<!--<xsl:variable name="document-uri" select="document-uri(.)"/>-->
	<!--<p><strong>Date(s):</strong><xsl:text> </xsl:text><xsl:value-of select="//teiHeader//sourceDesc/bibl[@type='sourceMetadata']/date"/></p>-->
	<!--<p class="item-spec"><strong>Encoding dates</strong><xsl:text>: </xsl:text><xsl:value-of select="$sortedDates" separator=", "/></p>-->

	<!-- Removed from <xsl:template match="*" priority="-10">-->
	<!--<xsl:if test="$title/text()">
		<xsl:attribute name="title">
			<xsl:value-of select="$title"/>
		</xsl:attribute>
	</xsl:if>-->
	<!-- Necessary to turn this off, otherwise it creates wonky tooltips.
	Tooltips as needed should be set on the specific element. -->

	<!-- Removed from <xsl:template match="lb">-->
	<!--<br/><xsl:if test="$class/text()"><xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute></xsl:if></br>-->
	<!--<xsl:variable name="lb-with-p">
		<xsl:choose>
			<xsl:when test="lb[child::p]"/>
			<xsl:otherwise>
				<br/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>-->
	<!-- <xsl:value-of select="$lb-with-p"/> -->

	<!-- Removed from <xsl:template match="app"> -->
	<!--<span class="app">
		<xsl:attribute name="title">
			<xsl:for-each select="rdg">
				<xsl:value-of select="concat(name(),': ', ., '; ')"/>
			</xsl:for-each>
		</xsl:attribute>
		<xsl:apply-templates select="rdg[1]"/>
	</span>-->

	<!-- Removed from <xsl:template match="del"> -->
	<!--<xsl:if test="@*">
		<xsl:attribute name="title">
			<xsl:value-of select="concat(name(), 'etion, ')"/>
			<xsl:for-each select="@*">
				<xsl:sort/>
				<xsl:if test="not(name()='status')">
					<xsl:value-of select="concat(name(),': ', ., '; ')"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:attribute>
	</xsl:if>-->
	
	<!-- Removed from <xsl:template match="figure"> -->
		<!-- newFigDesc goes away and applies templates to content to get it into a single dedupped string -->
		<!--<xsl:variable name="newHead">
			<xsl:apply-templates select="head" mode="normalizeHead"/>
		</xsl:variable>
		<xsl:variable name="newFigDesc">
			<xsl:apply-templates select="figDesc" mode="normalizeFigDesc"/>
		</xsl:variable>-->
		<!--<xsl:when test="head and $newFigDesc/text()">
			<span class="{concat(name(), ' ', @rend, ' ', @place)}" title="{concat('&quot;', $newHead, '.&quot; ', $newFigDesc)}">{figure}</span>
		</xsl:when>
		<xsl:when test="head and not($newFigDesc/text())">
			<span class="{concat(name(), ' ', @rend, ' ', @place)}" title="{concat('&quot;', $newHead, '.&quot; ')}">{figure}</span>
		</xsl:when>
		<xsl:when test="not(head) and $newFigDesc/text()">
			<span class="{concat(name(), ' ', @rend, ' ', @place)}" title="{$newFigDesc}">{figure}</span>
		</xsl:when>-->

		<!-- Removed from <xsl:template match="milestone"> -->
		<!--<hr class="{concat(name(), ' ', translate(@rend, '-', ''), ' ', 'second-line')}"/>-->

		<!-- Removed from: <xsl:template match="table"> / row /cell -->
		<!-- select="@*|node()" -->

	<!-- ******************* -->

	<!-- Code not in use, but that could be useful -->

	<!-- <xsl:template match="*[not(@type)][not(@reason)][not(@unit)][not(@extent)]" priority="-1">
		<span class="{name()}"><xsl:apply-templates select="@*|node()"/></span>
		</xsl:template> -->
	
	<!-- <xsl:template match="opener/add">
		<span
			class="opener-add {concat(name(), ' ', translate(@rend, '-', ''), ' ', translate(@place, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="address">
		<span class="address">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="addrLine">
		<br/>
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template> -->

	<!--<xsl:template match="choice/abbr">
		<span class="abbr diplomatic">
			<xsl:if test="../../expan">
				<xsl:attribute name="title"><xsl:value-of select="../../expan"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="choice/expan">
		<span class="abbr edited hidden">
			<xsl:if test="../../abbr">
				<xsl:attribute name="title"><xsl:value-of select="."/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="../../abbr[1]/node()"/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="choice/orig">
		<span class="orig diplomatic">
			<xsl:if test="../../reg">
				<xsl:attribute name="title">reg: <xsl:value-of select="../../reg"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="choice/reg" priority="10">
		<span class="reg edited hidden">
			<xsl:if test="../../orig">
				<xsl:attribute name="title">orig: <xsl:value-of select="../../orig"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="../../orig/node()"/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="dateline">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="figure/head">
		<span class="figHead">
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="figure/figDesc">
		<xsl:variable name="title"><xsl:apply-templates/></xsl:variable>
		<span class="figfigDesc" title="{$title}">{figure}</span>
	</xsl:template>-->

	<!-- Template passes through abbr, sic, and orig in head in normalizeHead mode -->
	<!--<xsl:template match="head//abbr|head//sic|head//orig" mode="normalizeHead">
		<xsl:apply-templates/>
	</xsl:template>-->

	<!-- remove gb spans -->
	<!--<xsl:template match="gb">
		<xsl:apply-templates/>
	</xsl:template>-->

	<!-- Template kills through expan, corr, reg, and supplied in head in normalizeHead mode -->
	<!--<xsl:template match="head//expan|head//corr|head//reg|head//supplied"
		mode="normalizeHead"/>-->

	<!-- Template passes through abbr, sic, and orig in figDesc in normalizeFigDesc mode -->
	<!--<xsl:template match="figDesc//abbr|figDesc//sic|figDesc//orig" mode="normalizeFigDesc">
		<xsl:apply-templates/>
	</xsl:template>-->

	<!-- Template kills through expan, corr, reg, and supplied in figDesc in normalizeFigDesc mode -->
	<!--<xsl:template match="figDesc//expan|figDesc//corr|figDesc//reg|figDesc//supplied"
		mode="normalizeFigDesc"/>-->

	<!--<xsl:template match="add[@place='marginleft']/figure|add[@place='marginright']/figure" priority="10">
		<xsl:choose>
		<xsl:when test="head">
			<span class="figure" title="{concat('&quot;', head, '.&quot; ', figDesc)}">figure</span>
		</xsl:when>
		<xsl:otherwise>
			<span class="figure" title="{figDesc}">figure</span>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->

	<!--<xsl:template match="tei:addSpan|p/anchor">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:anchor">		
		<xsl:apply-templates/>
		<br/>
	</xsl:template>-->

	<!--<xsl:template match="closer">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!-- foreign should be italiced in edited view -->
	<!-- <xsl:template match="foreign" xml:space="preserve">
		<span class="foreign diplomatic">
		<xsl:if test="@xml:lang">
			<xsl:attribute name="title">
				<xsl:value-of select="concat('lang: ', @xml:lang)"/>
			</xsl:attribute>
		</xsl:if>
				<xsl:apply-templates/>
		</span>
		<span class="foreign foreignItalic edited hidden" style="font-style:italic;">
		<xsl:if test="@xml:lang">
			<xsl:attribute name="title">
				<xsl:value-of select="concat('lang: ', @xml:lang)"/>
			</xsl:attribute>
		</xsl:if>
			<xsl:apply-templates/></span>
		</xsl:template>-->

	<!--<xsl:template match="fw[@type='pageno']">
		<span class="fw pageno">
			<xsl:apply-templates/>
		</span>
		<br/>
	</xsl:template>-->

	<!--<xsl:template match="lb">
		<br/>
		<xsl:variable name="num">
			<xsl:number level="any" from="pb"/>
		</xsl:variable>
		<xsl:if test="number($num) mod 5 =0">
			<span class="linenumber">
				<xsl:value-of select="$num"/>
			</span>
		</xsl:if>
	</xsl:template>-->
	<!--[not(ancestor::note)]-->

	<!--<xsl:template match="opener">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="postscript">
		<xsl:apply-templates/>
	</xsl:template>-->

	<!--<xsl:template match="space[@extent][@unit][@dim='vertical']" priority="1">
		<span class="space-other vertical verticalSpace">
			<xsl:attribute name="title">
				<xsl:for-each select="@*">
					<xsl:sort/>
					<xsl:value-of select="concat(name(),': ', ., '; ')"/>
				</xsl:for-each>
			</xsl:attribute>
			<xsl:for-each select="1 to @extent">
				<br class="verticalSpace"/>
			</xsl:for-each>
		</span>
	</xsl:template>-->	

	<!--<xsl:template match="opener/salute">
		<span class="opener-salute">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="closer/salute">
		<span class="closer-salute">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="signed">
		<span class="signed">
			<xsl:apply-templates/>
		</span>
	</xsl:template>-->

	<!--<xsl:template match="supplied">
	<span class="supplied edited hidden"> <xsl:if test="@*"> <xsl:attribute name="title">
		<xsl:value-of select="concat(name(), ', certainty: ', @cert, ', reason: ', @reason)"/>
		</xsl:attribute> </xsl:if>[<xsl:apply-templates select="node()"/>]</span></xsl:template>-->

<!--	<xsl:template match="trailer">
		<span class="{concat(name(), ' ', translate(@rend, '-', ''))}"><xsl:apply-templates/></span>
	</xsl:template>-->
</xsl:stylesheet>