<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--Καθορίζουμε τη μορφή εξόδου σε HTML με κωδικοποίηση UTF-8 για τα ελληνικά-->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!--Ξεκινάμε το template που πιάνει τη ρίζα του XML αρχείου-->
    <xsl:template match="/">
        <html>
            <head>
                <title>2.7.c Ταξινόμηση με βάση το IUCN</title>
            </head>
            <body>
                <!--Καθορίζουμε το περιεχόμενο του κυρίως μέρους της σελίδας-->
                <h2>2.7.c Ταξινόμηση με Βάση το IUCN (Μειωμένου Ενδιαφέροντος)</h2>
                
                <!--Δημιουργούμε τον πίνακα δεδομένων-->
                <table border="1">
                    <thead>
                        <tr>
                            <th>Όνομα Ζώου</th>
                            <th>Επιστημονική Ονομασία</th>
                            <th>Πληθυσμός στη Φύση</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Επιλέγουμε μόνο τα ζώα με κατηγορία IUCN "Μειωμένου Ενδιαφέροντος" και τα ταξινομούμε κατά φθίνουσα σειρά πληθυσμού-->
                        <xsl:apply-templates select="zoo_park/animal_list/animal[animal_characteristics/iucn='Μειωμένου Ενδιαφέροντος']">
                            <xsl:sort select="animal_characteristics/population" data-type="number" order="descending"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!--Template που εφαρμόζεται ξεχωριστά για κάθε ζώο (γραμμή πίνακα)-->
    <xsl:template match="animal">
        <tr>
            
            <!--Εμφάνιση του κοινού ονόματος του ζώου-->
            <td>
                <xsl:value-of select="animal_names_info/@animal_name"/>
            </td>
            
            <!--Έλεγχος και εμφάνιση της επιστημονικής ονομασίας-->
            <td>
                <xsl:choose>
                    <!--Αν η επιστημονική ονομασία υπάρχει και δεν είναι κενή, εμφάνισέ τη με πλάγια γράμματα-->
                    <xsl:when test="animal_names_info/@scientific_name and animal_names_info/@scientific_name != ''">
                        <i><xsl:value-of select="animal_names_info/@scientific_name"/></i>
                    </xsl:when>
                    <!--Αλλιώς, αν λείπει, εμφάνισε το μήνυμα Δεν διατίθεται-->
                    <xsl:otherwise>Δεν διατίθεται</xsl:otherwise>
                </xsl:choose>
            </td>
            
            <!--Εμφάνιση του πληθυσμού του ζώου στη φύση-->
            <td>
                <xsl:value-of select="animal_characteristics/population"/>
            </td>
            
        </tr>
    </xsl:template>
    
</xsl:stylesheet>