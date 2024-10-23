//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {MoodNft} from "../src/MoodNft.sol";
import {Test, console} from "forge-std/Test.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    address public USER = makeAddr("User");
    string public constant HAPPY_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPCEtLSBCYWNrZ3JvdW5kIENpcmNsZSAtLT4KICA8ZGVmcz4KICAgIDxyYWRpYWxHcmFkaWVudCBpZD0iZmFjZUdyYWRpZW50IiBjeD0iNTAlIiBjeT0iNTAlIiByPSI1MCUiIGZ4PSI1MCUiIGZ5PSI1MCUiPgogICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjogI0ZEREM4QTsgc3RvcC1vcGFjaXR5OiAxIiAvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiAjRkJDNjc4OyBzdG9wLW9wYWNpdHk6IDEiIC8+CiAgICA8L3JhZGlhbEdyYWRpZW50PgogIDwvZGVmcz4KICA8Y2lyY2xlIGN4PSIxMDAiIGN5PSIxMDAiIHI9IjkwIiBmaWxsPSJ1cmwoI2ZhY2VHcmFkaWVudCkiIC8+CgogIDwhLS0gRXllcyAtLT4KICA8ZWxsaXBzZSBjeD0iNjUiIGN5PSI4MCIgcng9IjIwIiByeT0iMTIiIGZpbGw9IndoaXRlIiAvPgogIDxlbGxpcHNlIGN4PSIxMzUiIGN5PSI4MCIgcng9IjIwIiByeT0iMTIiIGZpbGw9IndoaXRlIiAvPgoKICA8IS0tIFB1cGlscyAtLT4KICA8Y2lyY2xlIGN4PSI2NSIgY3k9IjgwIiByPSI3IiBmaWxsPSJibGFjayIgLz4KICA8Y2lyY2xlIGN4PSIxMzUiIGN5PSI4MCIgcj0iNyIgZmlsbD0iYmxhY2siIC8+CgogIDwhLS0gU3VidGxlIEV5ZWJhZ3MgLS0+CiAgPHBhdGggZD0iTTQ1LDkwIFE2NSwxMDAgODUsOTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI0Y5QUI2NCIgc3Ryb2tlLXdpZHRoPSIyIiAvPgogIDxwYXRoIGQ9Ik0xMTUsOTAgUTEzNSwxMDAgMTU1LDkwIiBmaWxsPSJub25lIiBzdHJva2U9IiNGOUFCNjQiIHN0cm9rZS13aWR0aD0iMiIgLz4KCiAgPCEtLSBNb3V0aCAoSGFwcHkgYnV0IFVuY2FubnkpIC0tPgogIDxwYXRoIGQ9Ik01MCwxMzAgUTEwMCwxNzAgMTUwLDEzMCBRMTIwLDE1MCA1MCwxMzAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI0Q2NzQ1RSIgc3Ryb2tlLXdpZHRoPSI1IiAvPgoKICA8IS0tIFN1YnRsZSBTaGFkb3dzIGZvciBSZWFsaXNtIC0tPgogIDxlbGxpcHNlIGN4PSIxMDAiIGN5PSIyMCIgcng9IjY1IiByeT0iMTUiIGZpbGw9InJnYmEoMCwwLDAsMC4xKSIgLz4KPC9zdmc+Cg==";

    string public constant SAD_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPCEtLSBGYWNlIE91dGxpbmUgLS0+CiAgPGVsbGlwc2UgY3g9IjEwMCIgY3k9IjEwMCIgcng9IjkwIiByeT0iMTAwIiBmaWxsPSIjZmZlMGJkIiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiIC8+CgogIDwhLS0gRXllcyAtLT4KICA8Y2lyY2xlIGN4PSI3MCIgY3k9IjgwIiByPSI4IiBmaWxsPSJibGFjayIgLz4KICA8Y2lyY2xlIGN4PSIxMzAiIGN5PSI4MCIgcj0iOCIgZmlsbD0iYmxhY2siIC8+CgogIDwhLS0gRXllYnJvd3MgLS0+CiAgPHBhdGggZD0iTTYwLDY1IFE3MCw2MCA4MCw2NSIgZmlsbD0ibm9uZSIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIyIiAvPgogIDxwYXRoIGQ9Ik0xMjAsNjUgUTEzMCw2MCAxNDAsNjUiIGZpbGw9Im5vbmUiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMiIgLz4KCiAgPCEtLSBNb3V0aCAoU2FkIGV4cHJlc3Npb24pIC0tPgogIDxwYXRoIGQ9Ik03MCwxNDAgUTEwMCwxMzAgMTMwLDE0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIyIiAvPgoKICA8IS0tIEZvcmVoZWFkIFdyaW5rbGVzIChDb3JyZWN0IHBsYWNlbWVudCkgLS0+CiAgPHBhdGggZD0iTTY1LDUwIFExMDAsNDUgMTM1LDUwIiBmaWxsPSJub25lIiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjEiIC8+CiAgPHBhdGggZD0iTTcwLDU1IFExMDAsNTAgMTMwLDU1IiBmaWxsPSJub25lIiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjEiIC8+Cjwvc3ZnPgo=";

    function setUp() public {
        moodNft = new MoodNft(SAD_SVG_URI, HAPPY_SVG_URI);
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }
}
