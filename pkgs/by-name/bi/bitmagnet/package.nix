{ lib
, buildGoModule
, fetchFromGitHub
, nix-update-script
}:

buildGoModule rec {
  pname = "bitmagnet";
  version = "0.10.0-beta.3";

  src = fetchFromGitHub {
    owner = "bitmagnet-io";
    repo = "bitmagnet";
    rev = "v${version}";
    hash = "sha256-rmQKVRm8n+E0bCnuAT6jDYj5Dw9oDSRmaH3+EjM52tw=";
  };

  vendorHash = "sha256-anQFAJeYrYyuVGq9nCy7v2cJSvU9l/edqOfqf2LS8H8=";

  ldflags = [ "-s" "-w" "-X github.com/bitmagnet-io/bitmagnet/internal/version.GitTag=v${version}" ];

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = {
    description = "Self-hosted BitTorrent indexer, DHT crawler, and torrent search engine";
    longDescription = ''
      A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.
    '';
    homepage = "https://bitmagnet.io/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ viraptor ];
    mainProgram = "bitmagnet";
  };
}
