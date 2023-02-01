<html>
    <body>
        <table border="2.2">
            <tr><td>Target</td><td>Successor</td></tr>        
            {
            for $word in collection('?select=*.xml')//w
            let $curr := lower-case(normalize-space($word))
            let $succ := lower-case(normalize-space($word/following-sibling::w[1]))
            where $curr eq 'has'
            return
            <tr>
                <td> {$curr} </td>
                <td> {$succ} </td>
            </tr>
            }
        </table>
    </body>
</html>