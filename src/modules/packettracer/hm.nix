{ ... }:
{
  name = "packettracer";
  cfg.persist = {
    logs.contents = [ "pt/logs/" ];
    data.contents = [ "pt/saves/" ];

    session.contents = [
      "pt/"
      ".local/share/Cisco Packet Tracer/"
    ];
  };
}
