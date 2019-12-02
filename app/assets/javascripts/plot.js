



var nostuff = [30,23,12,8];

var svg= d3.select('body').append('svg')
      .attr('height', 1000)
      .attr('width', 1000);


var bckgrnd = svg.append("path")
    .attr('d','M 4 450 h 495 v 100 h -495 Z')
    .attr('fill','lavender')
    .attr('stroke','DarkSlateGrey')
    .attr('stroke-width','1')
    .attr('class', 'bckgrndBox');


var axis = svg.append("path")
    .attr('d','M 5 450 L 5 550')
    .attr('fill','none')
    .attr('stroke','DarkSlateGrey')
    .attr('stroke-width','1');
var axis0 = svg.append("path")
    .attr('d','M 5 550 L 500 550')
    .attr('fill','none')
    .attr('stroke','DarkSlateGrey')
    .attr('stroke-width','3');
var axis20 = svg.append("path")
    .attr('d','M 5 530 L 500 530')
    .attr('fill','none')
    .attr('stroke','black')
    .attr('stroke-width','2');

var axis40 = svg.append("path")
    .attr('d','M 5 510 L 500 510')
    .attr('fill','none')
    .attr('stroke','black')
    .attr('stroke-width','1');

var axis60 = svg.append("path")
    .attr('d','M 5 490 L 500 490')
    .attr('fill','none')
    .attr('stroke','black')
    .attr('stroke-width','2');
var axis80 = svg.append("path")
    .attr('d','M 5 470 L 500 470')
    .attr('fill','none')
    .attr('stroke','black')
    .attr('stroke-width','1');
var axis100 = svg.append("path")
    .attr('d','M 5 450 L 500 450')
    .attr('fill','none')
    .attr('stroke','DarkSlateGrey')
    .attr('stroke-width','3');

var bar = svg.selectAll('rect')
               .data(stuff);

bar.enter().append('rect')
               .attr('x',function(d,i) {return (duff[i]*150)+20;})
               .attr('y',function(d,i) {return 450+d;})
               .attr('height', function(d,i) {return rectheights[i];})
               .attr('width', 40)
               .attr('class',function(d,i) {return classnames[i];}
)
;

var leg = svg.selectAll('circle')
                .data(legclass)

leg.enter().append('circle')
             .attr('r',10)
             .attr('cx', function(d,i) {return (i*40)+400;})
             .attr('cy',380)
             .attr('class', function(d,i) {return legclass[i];})


var legndlabel = svg.selectAll('.lgndlabel')
               .data(leglabel);

legndlabel.enter().append('text')
           .attr('x', function(d,i) {return (i*40)+395;})
           .attr('y', 405)
           .attr('class','lgndlabel')
           .text(function(d,i) {return leglabel[i]});
           
var label = svg.selectAll('.xlabel')
               .data(xlabelpos);

label.enter().append('text')
           .attr('x', function(d,i) {return d*150+20})
           .attr('y', 562)
           .attr('class','xlabel')
           .text(function(d,i) {return xlabels[i]});








console.log(stuff);
console.log(duff);
console.log(classnames);
