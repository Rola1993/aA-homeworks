import React from "react";
import { Route, Link } from "react-router-dom";

const MessageItem = ({ mess, name }) => {
    if(mess.direction == 'incoming') {
        return (
          <div style={{
              width: "500px",
              clear: "both",
              float: "left",
              marginBottom: "3px",
              backgroundColor: "#DADBDE",
              borderRadius: "4px"}}>
              <p>{name}: {mess.body}</p>
            
          </div>
        )
    } else {
        return (
          <div style={{
              width: "500px",
              clear: "both",
              float: "right",
              marginBottom: "3px",
              backgroundColor: "#2D6CD1", 
              color: "white",
              borderRadius: "4px"}}>
             <p>Me:  {mess.body}</p>
          </div>
        )
    }
}

export default class MessagesList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            name: '',
            error: null,
            isLoaded: false,
            messages: [],
            currentMessage: ''
        }
  
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }

    componentDidMount() {
        const conversationId = this.props.match.params.conversationId;
        this.conMes = conversationId + "messages";
        if (localStorage.hasOwnProperty(this.conMes)) {

            let value = localStorage.getItem(this.conMes);
            value = JSON.parse(value);
            this.setState({ messages: value });
        } else {
            fetch(`https://sec.meetkaruna.com/api/v1/conversations/${conversationId}?user_id=Rola1993`)
            .then(res => res.json())
            .then(result => {
                this.setState({
                    isLoaded: true,
                    messages: result.data.messages
                });
                }, error => {
                this.setState({ 
                    isLoaded: true, 
                    error });
                });
        }
        this.conName = conversationId + "name";
        if (localStorage.hasOwnProperty(this.conName)) {
            let nameVal = localStorage.getItem(this.conName);
            this.setState({ 
                name: nameVal,
                isLoaded: true  });
        } else {
            const { name } = this.props.location.state;
            this.setState({ 
                name: name,
                isLoaded: true });
            localStorage.setItem(this.conName, name);
        }
    }

    handleSubmit(e) {
        e.preventDefault();
        let updatedMessages = this.state.messages.concat([{
            body: this.state.currentMessage,
            direction: "outgoing"
            }]);
        this.setState({
          messages: updatedMessages,
          currentMessage: ""
        });
        localStorage.setItem(this.conMes, JSON.stringify(updatedMessages));
    }

    handleChange(e) {
        this.setState({
            currentMessage: e.target.value
        })
    }

    render() {
        const {name, error, isLoaded, messages, currentMessage} = this.state;

        if (error) {
            return <div>Error: {error.message}</div>
        } else if (!isLoaded) {
            return <div>Loading...</div>
        } else {
        return (
            <div> 
                <h1>Conversation with {name}</h1>
                <div style={{width: "800px", height: "400px", overflow: "scroll"}}>
                    {messages.map((mess,idx) => 
                      <MessageItem key={idx} mess={mess} name={name}/>
                    )}
                </div>
                <form onSubmit={this.handleSubmit}>
                    <input style={{ height: "36px", width: "750px", fontSize: "16px"}}
                      onChange={this.handleChange}
                      value={this.state.currentMessage}
                      placeholder="Type your message..."
                      tyoe="text"/>
                    <button style={{ height: "40px", fontSize: "16px" }}>Send</button>
                </form>
            </div>
        )
        }
    }
}