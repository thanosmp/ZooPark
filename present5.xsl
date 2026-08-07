<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Ζώα με ομιλία φροντιστή</title>
                <style>
                    body {
                        font-family: Arial, Helvetica, sans-serif;
                        background-color: #f4f8f4;
                        margin: 30px;
                    }

                    h1 {
                        text-align: center;
                        color: #1b5e20;
                    }

                    table {
                        width: 90%;
                        margin: 20px auto;
                        border-collapse: collapse;
                        background-color: white;
                        box-shadow: 0 2px 8px rgba(0,0,0,0.15);
                    }

                    th {
                        background-color: #2e7d32;
                        color: white;
                        padding: 10px;
                        border: 1px solid #1b5e20;
                    }

                    td {
                        padding: 9px;
                        border: 1px solid #c8e6c9;
                        text-align: center;
                    }

                    tr:nth-child(even) {
                        background-color: #f1f8e9;
                    }
                </style>
            </head>

            <body>
                <h1>Ζώα με ομιλία φροντιστή πάνω από 20 λεπτά</h1>

                <table>
                    <tr>
                        <th>Όνομα Ζώου</th>
                        <th>Επιστημονική Ονομασία</th>
                        <th>Διάρκεια Ομιλίας</th>
                        <th>Ημέρες / Ώρες</th>
                    </tr>

                    <xsl:for-each select="zoo_park/animal_list/animal[show_participation/trainer_speaking[number(duration) &gt; 20]]">
                        <tr>
                            <td>
                                <xsl:value-of select="animal_names_info/@animal_name"/>
                            </td>

                            <td>
                                <xsl:value-of select="animal_names_info/@scientific_name"/>
                            </td>

                            <td>
                                <xsl:value-of select="show_participation/trainer_speaking/duration"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="show_participation/trainer_speaking/duration/@unit"/>
                            </td>

                            <td>
                                <xsl:for-each select="show_participation/trainer_speaking/dates/date">
                                    <xsl:value-of select="."/>
                                    <xsl:text> (</xsl:text>
                                    <xsl:value-of select="@start_hour"/>
                                    <xsl:text>)</xsl:text>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
