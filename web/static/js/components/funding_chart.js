import React, { Component } from "react"
import { PieChart, Pie, Sector, Cell } from 'recharts';

const data = [
  {name: 'Wisconsin Presbytery', value: 75},
  {name: 'Grants', value: 10},
  {name: 'Churches/networks outside Wisconsin', value: 10},
  {name: 'Individuals', value: 5}
];
const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042'];
const RADIAN = Math.PI / 180;
const renderCustomizedLabel = ({ cx, cy, midAngle, innerRadius, outerRadius, percent, index }) => {
 	const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
  const x  = cx + radius * Math.cos(-midAngle * RADIAN);
  const y = cy  + radius * Math.sin(-midAngle * RADIAN);

  return (
    <text x={x} y={y} fill="white" textAnchor={x > cx ? 'start' : 'end'} 	dominantBaseline="central">
    	{`${(percent * 100).toFixed(0)}%`}
    </text>
  );
};


class FundingChart extends Component {
  render() {
    return (
    	<PieChart width={300} height={300} onMouseEnter={this.onPieEnter}>
        <Pie
          data={data}
          labelLine={false}
          label={renderCustomizedLabel}
          outerRadius={150}
          fill="#8884d8">
        	{
          	data.map((entry, index) => <Cell fill={COLORS[index % COLORS.length]}/>)
          }
        </Pie>
      </PieChart>
    )
  }
}

export default FundingChart
