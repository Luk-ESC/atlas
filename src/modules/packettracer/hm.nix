{ pkgExists, ... }:
{
  name = "packettracer";
  autoEnable = pkgExists "ciscoPacketTracer8";
  cfg.persist = {
    logs.contents = [ "pt/logs/" ];
    data.contents = [ "pt/saves/" ];

    session.contents = [
      "pt/"
      ".local/share/Cisco Packet Tracer/"
    ];
  };
}
