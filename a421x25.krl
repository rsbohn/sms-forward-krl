ruleset aXXXxYYY {
  // webhook sms:
  // http://webhooks.kynetxapps.net/t/aXXXxYYY.dev/sms
  meta {
    name "simple-forward"
    description <<
      simple-forward
    >>
    author "Randall Bohn"
    logging off
    key cellphone "+18015551212"
  }

  dispatch {
  }

  global {
  
  }

  rule sms_forward is active {
    select when twilio sms 
    pre { 
      message = event:param("Body");
      cell = keys:cellphone();
    }
    twilio:sms("MSG:#{message}") with to = cell;
  }
}
