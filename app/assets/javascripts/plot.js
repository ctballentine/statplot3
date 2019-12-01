



var stuff = [30,23,12,8];

var svg= d3.select('body').append('svg')
      .attr('height', 1000)
      .attr('width', 1000);


var bar = svg.selectAll('rect')
               .data(stuff);

bar.enter().append('rect')
               .attr('x',function(d,i) {return 20*i+20;})
               .attr('y',function(d,i) {return d;})
               .attr('height', 20)
               .attr('width', 8);
