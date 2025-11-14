<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 8, 2025</xd:p>
            <xd:p><xd:b>Author:</xd:b> Floriane</xd:p>
            <xd:p>This XSLT transforms a TEI XML document into structured HTML, including modular templates for metadata, navigation, sidebar, main content, and footer. Designed for a French translation of J.R.R. Tolkien’s poems.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Main entry point of the transformation.</xd:p>
            <xd:p>Generates the complete HTML page structure by calling templates for each section.</xd:p>
            <xd:p>Note: The &lt;div&gt; with class="main-wrapper" contains all the main layout content except the sidebar. 
                It encloses the navigation bar, header, main content, and footer, and closes just before the end of the &lt;body&gt; element. 
                This structure allows dynamic layout adjustments (e.g., responsive design or sidebar toggling) without affecting the sidebar.</xd:p>
        </xd:desc>
        <xd:return>
            Outputs a complete HTML document with head, sidebar, navigation bar, main content, and footer.
        </xd:return>
    </xd:doc>
    <xsl:template match="/">
        <html lang="fr">
            <head><xsl:call-template name="metadata-header"/></head>
            <body>
                <xsl:call-template name="sidebar"/> 
                <div class="main-wrapper">
                    <xsl:call-template name="navigation-bar"/>
                    <header>
                        <h1><xsl:value-of select="TEI/text/body/head"/></h1>
                        <p>Résumé du sujet</p>
                    </header>
                    <main>
                        <xsl:call-template name="generate-text-section"/>
                    </main>
                    <xsl:call-template name="footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Creates the HTML head with metadata and linked resources.</xd:p>
            <xd:p>Includes viewport, description, author, keywords, title, CSS, and JS references.</xd:p>
        </xd:desc>
        <xd:return>
            HTML &lt;head&gt; content containing metadata and resource links.
        </xd:return>
    </xd:doc>
    <xsl:template name="metadata-header">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="description" content="A French translation of J.R.R. Tolkien poems"/>
        <meta name="author" content="J.R.R. Tolkien, translated by Lord Bijon"/>
        <meta name="keywords" content="poetry, fantasy, translation"/>
        <title><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/></title>
        <link rel="stylesheet" href="../CSS/FG_stylesheet.css"/>
        <script defer="" src="../JS/my_function2.js"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Generates the sidebar navigation menu with links to all main pages.</xd:p>
            <xd:p>Includes an accessible close button.</xd:p>
        </xd:desc>
        <xd:return>
            HTML &lt;aside&gt; element representing the sidebar menu.
        </xd:return>
    </xd:doc>
    <xsl:template name="sidebar">
        <aside class="sidebar" id="mySidebar" aria-label="Menu principal">
            <a class="closebtn" href="#" onclick="closeNav()" aria-label="Fermer le menu">×</a>
            <ul>
                 <li><a href="../index.html">Accueil</a></li>
                <li><a href="1_poeme.html">Poème à l'Anneau</a></li>
                <li><a href="2_prose.html">Définition de la TEI</a></li>
            </ul>
        </aside>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Creates the top navigation bar with toggle button and download links.</xd:p>
        </xd:desc>
        <xd:return>
            HTML &lt;nav&gt; element with interactive controls and download links.
        </xd:return>
    </xd:doc>
    <xsl:template name="navigation-bar">
        <nav>
            <button class="openbtn" onclick="openNav()" aria-label="Ouvrir le menu de navigation" aria-expanded="false">☰ Navigation</button>
            <div class="download">
                <a href="../TEI/Encodage_po%C3%A8me_Exercice_0.2_corrig%C3%A9.xml" class="button" download="">[↓] XML-TEI</a>
                <a href="../my_document.pdf" class="button" target="_blank">[↓] PDF</a>
            </div>
        </nav>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Processes TEI &lt;lg&gt; elements to generate HTML sections with titles, lines, and images.</xd:p>
            <xd:p>Note that each [section + figure] part is wrapped in a div class"content-wrapper" serving as contenaire</xd:p>
            <xd:p>Each line is displayed with its line number for reference.</xd:p>
        </xd:desc>
        <xd:return>
            HTML &lt;section&gt; elements containing text and images for each poem.
        </xd:return>
    </xd:doc>
    <xsl:template name="generate-text-section">
        <xsl:for-each select="TEI/text/body/lg">
            <div class="content-wrapper">
                <section class="texte">
                    <h2><xsl:value-of select="head"/></h2>
                    <p>
                        <xsl:for-each select="l">
                            <span class="line-number"><xsl:value-of select="@n"/></span>
                            <xsl:value-of select="."/><br/>
                        </xsl:for-each>
                    </p>
                </section>
                <figure class="text-image">
                    <img src="{concat('../IMG/image_', @type, '_', @n,'.png')}" 
                        alt="{concat('image_', @type, '_', @n)}"/>
                    <figcaption/>
                </figure>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Builds the footer containing citation terms, contact info, and logos.</xd:p>
        </xd:desc>
        <xd:return>
            HTML &lt;footer&gt; element containing credits and institutional logos.
        </xd:return>
    </xd:doc>
    <xsl:template name="footer">
        <footer>
            <section id="credits">
                <p><strong>Terms of Use and Citation:</strong> The citation terms are as follows: "citation dans le format désiré"</p>
                <p>Coding &amp; design: <a href="mailto:surname.name@domaine.ch">surname.name@domaine.ch</a></p>
            </section>
            <section id="logos">
                <figure class="logos-images">
                    <img src="../IMG/ihr_logo.png" alt="Logo IHR"/>
                    <img src="../IMG/SNF_logo.png" alt="Logo SNF"/>
                    <img src="../IMG/CUSO_logo.png" alt="Logo CUSO"/>
                </figure>
            </section>
        </footer>
    </xsl:template>
    
</xsl:stylesheet>
