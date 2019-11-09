import React from 'react';
import ReactDOM from 'react-dom';

import { connect } from 'react-redux';
import { Form, Button, Alert } from 'react-bootstrap';
import { Redirect } from 'react-router';

import { add_user } from './ajax';
import store from './store'

class Signup extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      redirect: null,
    };
  }

  redirect(path) {
    this.setState({
      redirect: path,
    });
  }

  changed(data) {
    this.props.dispatch({
      type: 'CHANGE_NEW_USER',
      data: data,
    });
  }

  render() {
    let {email, name, password, password_confirmation,errors,dispatch} = this.props;
    let error_msg = null;
    if (errors) {
      error_msg = <Alert variant="danger">{ errors }</Alert>;
    }
	
    if (this.state.redirect) {
      return <Redirect to={this.state.redirect} />
    }

    return (
      <div>
        <h1>Sign Up</h1>
        { error_msg }
        <Form.Group controlId="email">
          <Form.Label>Email</Form.Label>
          <Form.Control type="text" onChange={
            (ev) => this.changed({email: ev.target.value})} />
        </Form.Group>
	<Form.Group controlId="name">
          <Form.Label>Name</Form.Label>
          <Form.Control type="text" onChange={
            (ev) => this.changed({name: ev.target.value})} />
        </Form.Group>
	<Form.Group controlId="is_manager">
          <Form.Label>Are you a manager?</Form.Label>
          <Form.Control as="select"  onChange={
            (ev) => this.changed({is_manager: ev.target.value})} >
	    <option>Yes</option>
            <option>No</option>
	  </Form.Control>
        </Form.Group>
	<Form.Group controlId="password">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" onChange={
            (ev) => this.changed({password: ev.target.value})} />
        </Form.Group>
	<Form.Group controlId="password_confirmation">
          <Form.Label>Password Confirmation</Form.Label>
          <Form.Control type="password" onChange={
            (ev) => this.changed({password_confirmation: ev.target.value})} />
        </Form.Group>
        <Form.Group controlId="submit">
          <Button variant="primary" onClick={() => add_user(this)}>
            Sign Up
          </Button>
        </Form.Group>
      </div>
    );
  }
}

function state2props(state) {
  return state.forms.signup;
}
export default connect(state2props)(Signup);
