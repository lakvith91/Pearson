// Morris.js Charts sample data for SB Admin template

$(function() {

   
 
    ////////// Donut Chart for general////////////////////////////////////
    Morris.Donut({
        element: 'morris-donut-chart-Individual',
        data: [{
                label: "Food Expenses",
                value: 38
            }, {
                label: "Internet Expenses",
                value: 19
            }, {
                label: "Other Expenses",
                value: 05
            }],
        resize: true
    });


    ///////// Bar Chart for general///////////
    var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "Octomber", "November", "December"];
    var claimValueIndiv = [];//array for genaral

    for (var i = 0; i < 12; i++) {
        claimValueIndiv[i] = i * 100 + 1000;
    }

    Morris.Bar({
        element: 'morris-bar-chart-Individual',
        data: [{
                Month: month[0],
                geekbench: claimValueIndiv[0]
            }, {
                Month: month[1],
                geekbench: claimValueIndiv[1]
            }, {
                Month: month[2],
                geekbench: claimValueIndiv[2]
            }, {
                Month: month[3],
                geekbench: claimValueIndiv[3]
            }, {
                Month: month[4],
                geekbench: claimValueIndiv[4]
            }, {
                Month: month[5],
                geekbench: claimValueIndiv[5]
            }, {
                Month: month[6],
                geekbench: claimValueIndiv[6]
            }, {
                Month: month[7],
                geekbench: claimValueIndiv[7]

            }, {
                Month: month[8],
                geekbench: claimValueIndiv[8]
            }, {
                Month: month[9],
                geekbench: claimValueIndiv[9]
            }, {
                Month: month[10],
                geekbench: claimValueIndiv[10]

            }, {
                Month: month[11],
                geekbench: claimValueIndiv[11]
            }],
        xkey: 'Month',
        ykeys: ['geekbench'],
        labels: ['Claim Value'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        resize: true
    });
  
});
