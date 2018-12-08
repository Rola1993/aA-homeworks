import React from 'react';
import { Route, Link } from "react-router-dom";

const Conversation = ({ con }) => (
  <div>
    <Link to={{ pathname: `/${con.uuid}`, state: { name: con.name } }}>
        <button style={{width: "200px"}}>
            <p>{con.name}</p>
            <p>Unread: {con.unread}</p>
            <p>{con.last_message.created_at}</p>
        </button>
    </Link>
  </div>
);

export default class Chatroom extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
          error: null,
          isLoaded: false,
          conversations: [],
          searchName: ''
        };
        this.filterList = this.filterList.bind(this);
    }

    componentDidMount() {
        fetch("https://sec.meetkaruna.com/api/v1/conversations?user_id=Rola1993")
        .then(res => res.json())
        .then(
            (result) => {
                this.setState({
                    isLoaded: true,
                    conversations: result.data
                });
            },
            (error) => {
                this.setState({
                    isLoaded:true,
                    error
                })
            }
        )
    }

    filterList(e) {
        e.preventDefault();
        var updatedList = this.state.conversations;
        updatedList = updatedList.filter( (item) => {
            return item.name.toLowerCase().search(
                e.target.value.toLowerCase()) !== -1;
        });
        this.setState({ conversations: updatedList });
    }

    render() {
        const { error, isLoaded, conversations, searchName } = this.state;

        const sorted_conversations = conversations.sort(function(a,b){
            return new Date(b.last_message.created_at) - new Date(a.last_message.created_at);
        });

        if (error) {
            return <div>Error: {error.message}</div>
        } else if (!isLoaded) {
            return <div>Loading...</div>
        } else {
            return (
                <div>
                    <h1>My Conversations</h1>
                    <form>
                        <input style={{ height: "36px", width: "250px", fontSize: "16px" }}
                            onChange={this.filterList}
                            placeholder="Search conversation by name"
                            tyoe="text" />
                    </form>
                    <div>
                        {sorted_conversations.map(con => (
                            < Conversation key={con.uuid} con={con} />
                        ))}
                    </div>
                </div>
            )
        }

    }
}

