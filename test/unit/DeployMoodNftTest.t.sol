//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {MoodNft} from "../../src/MoodNft.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft deployMoodNft;

    function setUp() public {
        deployMoodNft = new DeployMoodNft();
    }

    function testConvertSvgToImgURI() public view {
        string memory happySvgURI =
            "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+IDwhLS0gQmFja2dyb3VuZCBDaXJjbGUgLS0+IDxkZWZzPiA8cmFkaWFsR3JhZGllbnQgaWQ9ImZhY2VHcmFkaWVudCIgY3g9IjUwJSIgY3k9IjUwJSIgcj0iNTAlIiBmeD0iNTAlIiBmeT0iNTAlIj4gPHN0b3Agb2Zmc2V0PSIwJSIgc3R5bGU9InN0b3AtY29sb3I6ICNGRERDOEE7IHN0b3Atb3BhY2l0eTogMSIgLz4gPHN0b3Agb2Zmc2V0PSIxMDAlIiBzdHlsZT0ic3RvcC1jb2xvcjogI0ZCQzY3ODsgc3RvcC1vcGFjaXR5OiAxIiAvPiA8L3JhZGlhbEdyYWRpZW50PiA8L2RlZnM+IDxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgcj0iOTAiIGZpbGw9InVybCgjZmFjZUdyYWRpZW50KSIgLz4gPCEtLSBFeWVzIC0tPiA8ZWxsaXBzZSBjeD0iNjUiIGN5PSI4MCIgcng9IjIwIiByeT0iMTIiIGZpbGw9IndoaXRlIiAvPiA8ZWxsaXBzZSBjeD0iMTM1IiBjeT0iODAiIHJ4PSIyMCIgcnk9IjEyIiBmaWxsPSJ3aGl0ZSIgLz4gPCEtLSBQdXBpbHMgLS0+IDxjaXJjbGUgY3g9IjY1IiBjeT0iODAiIHI9IjciIGZpbGw9ImJsYWNrIiAvPiA8Y2lyY2xlIGN4PSIxMzUiIGN5PSI4MCIgcj0iNyIgZmlsbD0iYmxhY2siIC8+IDwhLS0gU3VidGxlIEV5ZWJhZ3MgLS0+IDxwYXRoIGQ9Ik00NSw5MCBRNjUsMTAwIDg1LDkwIiBmaWxsPSJub25lIiBzdHJva2U9IiNGOUFCNjQiIHN0cm9rZS13aWR0aD0iMiIgLz4gPHBhdGggZD0iTTExNSw5MCBRMTM1LDEwMCAxNTUsOTAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI0Y5QUI2NCIgc3Ryb2tlLXdpZHRoPSIyIiAvPiA8IS0tIE1vdXRoIChIYXBweSBidXQgVW5jYW5ueSkgLS0+IDxwYXRoIGQ9Ik01MCwxMzAgUTEwMCwxNzAgMTUwLDEzMCBRMTIwLDE1MCA1MCwxMzAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI0Q2NzQ1RSIgc3Ryb2tlLXdpZHRoPSI1IiAvPiA8IS0tIFN1YnRsZSBTaGFkb3dzIGZvciBSZWFsaXNtIC0tPiA8ZWxsaXBzZSBjeD0iMTAwIiBjeT0iMjAiIHJ4PSI2NSIgcnk9IjE1IiBmaWxsPSJyZ2JhKDAsMCwwLDAuMSkiIC8+IDwvc3ZnPg==";
        string memory happySvg =
            '<svg width="200" height="200" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg"> <!-- Background Circle --> <defs> <radialGradient id="faceGradient" cx="50%" cy="50%" r="50%" fx="50%" fy="50%"> <stop offset="0%" style="stop-color: #FDDC8A; stop-opacity: 1" /> <stop offset="100%" style="stop-color: #FBC678; stop-opacity: 1" /> </radialGradient> </defs> <circle cx="100" cy="100" r="90" fill="url(#faceGradient)" /> <!-- Eyes --> <ellipse cx="65" cy="80" rx="20" ry="12" fill="white" /> <ellipse cx="135" cy="80" rx="20" ry="12" fill="white" /> <!-- Pupils --> <circle cx="65" cy="80" r="7" fill="black" /> <circle cx="135" cy="80" r="7" fill="black" /> <!-- Subtle Eyebags --> <path d="M45,90 Q65,100 85,90" fill="none" stroke="#F9AB64" stroke-width="2" /> <path d="M115,90 Q135,100 155,90" fill="none" stroke="#F9AB64" stroke-width="2" /> <!-- Mouth (Happy but Uncanny) --> <path d="M50,130 Q100,170 150,130 Q120,150 50,130" fill="none" stroke="#D6745E" stroke-width="5" /> <!-- Subtle Shadows for Realism --> <ellipse cx="100" cy="20" rx="65" ry="15" fill="rgba(0,0,0,0.1)" /> </svg>';
        string memory testing = deployMoodNft.svgToImgURI(happySvg);
        assert(keccak256(abi.encodePacked(testing)) == keccak256(abi.encodePacked(happySvgURI)));
    }
}