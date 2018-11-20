import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {
      num1: '',
      num2: '',
      result: 0
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    const num1 = e.target.value ? Number(e.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(e) {
    e.preventDefault();
    const num2 = e.target.value ? Number(e.target.value) : "";
    this.setState({ num2 });
  }

  handleClick(e) {
    e.preventDefault();
    switch(e.target.value) {
      case '+':
        var res = this.state.num1 + this.state.num2;
        this.setState({
          result: res
        })
        break;
      case '-':
        var res = this.state.num1 - this.state.num2;
        this.setState({
          result: res
        });
        break;
      case '*':
        var res = this.state.num1 * this.state.num2;
        this.setState({
          result: res
        });
        break;  
      case '/':
        var res = this.state.num1 / this.state.num2;
        this.setState({
          result: res
        });
        break;    
    }
    
  }

  clear(e) {
    e.preventDefault();

    this.setState({
      num1: '',
      num2: '',
      result: 0
    });
  }


  render() {
    return (
      <div>
      <label>1st Number:</label>
        <input 
        type="text" 
        value = {this.state.num1}
        onChange={this.setNum1} />
      <input type='button' onClick={this.handleClick} value='+' />
      <input type='button' onClick={this.handleClick} value='-' />
      <input type='button' onClick={this.handleClick} value='*' />
      <input type='button' onClick={this.handleClick} value='/' />
      <label>2nd Number:</label>
        <input 
        type="text"
        value = {this.state.num2}
        onChange={this.setNum2} />
        <span>= {this.state.result}</span>
        <button onClick={this.clear}>reset!</button>
      </div>
    );
  }
}

export default Calculator;
