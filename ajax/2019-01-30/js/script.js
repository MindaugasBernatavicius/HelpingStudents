$(document).ready(function() {
    // inicializuojame vėliau naudosimus kintamuosius
    var error401 = 'Neteisingas vartotojo vardas ir / ar slaptažodis';
    var baseURL = 'http://kitmjavascript.azurewebsites.net/api'

    // pagalbinės funkcijos
    function increaseBalanceBy1000(currentBalance){
        let balanceAsFloat = parseFloat(currentBalance.replace(/[\$,]/g, ''));
        let increasedBalance = balanceAsFloat + 1000;
        return "$" + increasedBalance;
    }

    function onUnsuccessFullLogin(){
        $("#error_display").text(error401)
            .css({'visibility': 'visible'});
    }

    function onSuccessFullLogin(){
        $("#error_display").css({'visibility': 'hidden'});
        $(".container").css({'visibility': 'hidden'});
        $.ajax({
            url: baseURL + '/studentai',
            contentType: 'application/json; charset=utf-8',
            success: function(data){
                var json = JSON.parse(data);
                var table = $('<table>');
                var tblHeader = "<tr>";
                                        // name, age, picture, balance, tags, registered, favoriteFruit
                var tableHeaders = ['#','name','age','picture','balance','tags','registered','favoriteFruit'];
                for (var i = 0; i < tableHeaders.length; i++){
                    tblHeader += "<th>" + tableHeaders[i] + "</th>";
                }
                tblHeader += "</tr>";
                $(tblHeader).appendTo(table);

                var tblRow = "<tr>";
                var printedNumber = 0;
                $.each(json, function(index, value){
                    // tikriname ar studentas aktyvus
                    if(value['isActive'] === true){
                        printedNumber++;
                        tblRow  += "<td>" + printedNumber + "</td>" // number
                                + "<td>" + value[tableHeaders[1]] + "</td>" // name
                                + "<td>" + value[tableHeaders[2]] + "</td>" // age
                                + "<td><img src=\"" + value[tableHeaders[3]] + "\"/></td>" // picture
                                + "<td>" + increaseBalanceBy1000(value[tableHeaders[4]]) + "</td>"
                                + "<td>" + value[tableHeaders[5]] + "</td>" // tags
                                + "<td>" + value[tableHeaders[6]] + "</td>" // registered
                                + "<td>" + value[tableHeaders[7]] + "</td>" // favoriteFruit
                                + "</tr>";
                    }
                });
                $(table).append(tblRow);
                $('body').html($(table));
            }
        });
    }

    // Event handlers
    $('#loginform').submit(function(e) {
        // užkertame kelią default formos elgsenai
        e.preventDefault();

        // gauname įvesties kintamuosius iš formos
        var un = $("#username").val();
        var pw = $("#password").val();

        // siunčiame POST užklausą, su formos duomenimis AJAX'u
        $.ajax({
            type: "POST",
            contentType: 'application/json; charset=utf-8',
            url: baseURL + '/login',
            data: '{username:"' + un +'", password:"' + pw + '"}',
            success: function(data){
                if(data.statusCode === 401){
                    onUnsuccessFullLogin();
                } else if(data.statusCode === 200){
                    onSuccessFullLogin();
                } else {
                    // galima patobulinti, bet nenurodyta reikalavimuose
                    console.log(data);
                }
            },
            error: function (data){
                // galima patobulinti, bet nenurodyta reikalavimuose
                console.log(data);
            }
        });
    });
});
