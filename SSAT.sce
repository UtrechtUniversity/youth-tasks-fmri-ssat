# 2017 - ppas, mvink
# HEADER
scenario = "SSAT - short";
response_matching = simple_matching;
active_buttons = 2;
button_codes = 1, 2;
default_background_color = 100, 100, 100;
default_font = "Arial";
default_font_size = 40;

# SDL
begin;

picture{
	text{caption = "Voer subjectcode in"; font_size = 24;}subjcode_instr; x = 0; y = 0;
	text{caption = " "; font_size = 24;} subjcode; x = 0; y = -200;
}pic_input_subjcode;

picture{
	text{caption = "SSAT\n\n 1. Training I \n 2. Training II \n 3. Training III"; font_size = 24; text_align = align_left;}taskselect_text;	x = 0; y = 0;
	text{caption = " "; font_size = 24; }taskinput_text;x = 0; y = -200;
}taskselect_picture;

picture{
}subjcode_picture;

picture{
	text {caption = "Nog even wachten op de scanner..."; font_size = 24;} wait_text;
	x = 0; y = 0;
} waiting_picture;

picture{
	text{caption = "bla"; font_size = 24;}subject_entered; x = 0; y = +200;
	text{caption = "Let op, de ingevoerde subjectcode bestaat al in de MRI_log map!\n\nWil je doorgaan en de data naar hetzelfde bestand schrijven? y/n"; font_size = 20;}duplicate_txt; x = 0; y = 0;
	text{caption = " "; font_size = 24;} overwrite_yn; x = 0; y = -200;
}pic_input_duplicate;

trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 2;
	stimulus_event
	{
		picture waiting_picture;
		time = 0;
		code = "wait_to_begin";
	} wait_event;
} wait_for_trigger;

picture{
	text {
			caption = "X"; 
			font_color = 100,100,100;
		} boxes_text; 
	x = 0; y = -150;
		line_graphic {
		coordinates = -40, 200, 40, 200;
		line_width = 4;
	} Upper_line1;
	x = 0; y = 0;
	line_graphic {
		coordinates = -40, 140, 40, 140;
		line_width = 4;
	} Middle_line1;
	x = 0; y = 0;
	line_graphic {
		coordinates = -40, -100, 40, -100;
		line_width = 4;
	} Lower_line1;
	x = 0; y = 0;
	box { height = 10; width = 20; color = 255, 255, 255; } the_box;
	x = 0; y = 0;
	#box {height = 40; width = 40; color = 150,150,150;} indicator1_box1; x = -50; y = -75; 
	#box {height = 40; width = 40; color = 150,150,150;} indicator1_box2; x = -50; y = 5;
	#box {height = 40; width = 40; color = 150,150,150;} indicator1_box3; x = -50; y = 95;
	#box {height = 40; width = 40; color = 150,150,150;} indicator1_box4; x = -50; y = 175;
} boxes_picture;

trial {
	trial_duration = 50;
	trial_type = fixed;
	stimulus_event
	{
		picture boxes_picture;
		time = 0;
	} event0;
} trial_sample;

trial {
	trial_duration = 200; # Old value 216 Changed to take refresh rate into account
	trial_type = fixed;
	stimulus_event
	{
		picture boxes_picture;
		time = 0;
		code = "feedback";
	} feedback_event;
} feedback_trial;

picture{
	line_graphic {
		coordinates = -40, 200, 40, 200;
		line_width = 4;
	} Upper_line2;
	x = 0; y = 0;
	line_graphic {
		line_color = 255,255,255,255;
		coordinates = -40, 140, 40, 140;
		line_width = 4;
	} Middle_line2;
	x = 0; y = 0;
	line_graphic {
		coordinates = -40, -100, 40, -100;
		line_width = 4;
	} Lower_line2;
	x = 0; y = 0;
	#box {height = 40; width = 40; color = 150,150,150;} indicator2_box1; x = -50; y = -75; 
	#box {height = 40; width = 40; color = 150,150,150;} indicator2_box2; x = -50; y = 5;
	#box {height = 40; width = 40; color = 150,150,150;} indicator2_box3; x = -50; y = 95;
	#box {height = 40; width = 40; color = 150,150,150;} indicator2_box4; x = -50; y = 175;
} ITI_picture;

picture{
	line_graphic {
		coordinates = -40, 200, 40, 200;
		line_width = 4;
	} Upper_line3;
	x = 0; y = 0;
	text {
		caption = " "; 
		font_color = 255,255,255;
	} cue_text; 
	x = 0; y = 158;
	line_graphic {
		line_color = 255,255,255,255;
		coordinates = -40, 140, 40, 140;
		line_width = 4;
	} Middle_line3;
	x = 0; y = 0;
	line_graphic {
		coordinates = -40, -100, 40, -100;
		line_width = 4;
	} Lower_line3;
	x = 0; y = 0;
} cue_picture;

trial {
	trial_duration = 747; # 764-216 doesnt work
	trial_type = fixed;
	stimulus_event
	{
	picture ITI_picture;
	time = 0;
	}ITI_event1;

	stimulus_event
	{
	picture cue_picture;
	deltat = 300;
	}ITI_event2;
		
} trial_ITI;

trial {
trial_duration = 1947; # 1964 Changed to take refreshrate into account at 60 Hz 17msec
	trial_type = fixed;
	stimulus_event
	{
	picture ITI_picture;
	time = 0;
	}null_event;
}trial_null;


trial {
	trial_duration = 6000;
	trial_type = first_response;
	picture {text {caption = "Einde van deze taak\n";} goodbye_text; x = 0; y = 0;
	};
} goodbye_trial;

trial {
	trial_duration = 2000;
	trial_type = first_response;
	picture {text {caption = "Einde van deze oefening\n";} goodbye_practice_text; x = 0; y = 0;
	};
} goodbye_practice;

trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {text {caption = "Einde van deze oefeningen\n";} final_goodbye_practice_text; x = 0; y = 0;
	};
} final_goodbye_practice;


# PCL
begin_pcl;

# DEFAULT SETTINGS
int rep = 0;
int Fs = 1;
int boxRiseTime = 1000;
int overshoot = 150;
int maxLength = 300;
int acc;
int resp;
int respOnset;
int stop_time;
int stop;
int SSD1 = 300; # All SSD Changed SDP from 250
int SSD2 = 300;
int SSD3 = 300;
int SSD4 = 300;
int SSDstep = 25;
int SSD;
int SSDMax = 600;
int SSDMin = 100;
int nextcue;
int animStartTime; 
int trialEndTime;
string logFileName;
int respDelay = 2000;

int corr_tr = 0;
array<int> trialRT[1000];

trial_sample.set_duration(Fs);

array<int> cue_type[1000];
array<int> tr_type[1000];
array<int> ITI[1000];


# FILE MANAGEMENT
system_keyboard.set_delimiter('\n');
#string subjectcode = system_keyboard.get_input(pic_input_subjcode,subjcode);
string subjectcode = logfile.subject();

# determine 'MRI' or 'Oefen'
string logdir = logfile_directory;
int dirsize = logdir.count();
string runtype = logdir.substring(dirsize-3,3);
string logtype;
string task;
if runtype == "MRI" then
	logtype = "inhibmribehav_";
	task = "4";
else
	logtype = "inhibmockbehav_";
	task = system_keyboard.get_input(taskselect_picture,taskinput_text);
end;

input_file seq_file = new input_file;
if task == "1" then
	seq_file.open( "seq_file_training1.txt" );
	seq_file.set_delimiter( '\t' );
	logFileName = "SSAT_Training1_" + subjectcode + "_" + date_time("ddmmyyhhnnss")+".txt";	
elseif task == "2" then
	seq_file.open( "seq_file_training2.txt" );
	seq_file.set_delimiter( '\t' );
	logFileName = "SSAT_Training2_" + subjectcode + "_" + date_time("ddmmyyhhnnss")+".txt";
elseif task == "3" then
	seq_file.open( "seq_file_training3.txt" );
	seq_file.set_delimiter( '\t' );
	logFileName = logtype + subjectcode + "_" + date_time("yyyymmdd") + ".txt";
elseif task == "4" then
	seq_file.open( "seq_file_fmri.txt" );
	seq_file.set_delimiter( '\t' );
	logFileName = logtype + subjectcode + "_" + date_time("yyyymmdd") + ".txt";
end;

output_file outputfile = new output_file;

if file_exists( logdir + logFileName ) then
	subject_entered.set_caption( "'" + subjectcode + "'" );
	subject_entered.redraw();
	string logappend = system_keyboard.get_input(pic_input_duplicate,overwrite_yn);
	if logappend == "n" then
		exit();
	end;
end;

loop until seq_file.end_of_file()
begin         
      rep = rep + 1;
		cue_type[rep] = seq_file.get_int();
      tr_type[rep] = seq_file.get_int();
end;

# MAIN LOOP
if task == "4" then
	wait_for_trigger.present();
end;

outputfile.open_append( logFileName );
outputfile.print("trial_number\ttrial_time\tcue_type\tstim_type\tacc\trespOnset\tSSD\n");
	
int expStartTime = clock.time();

loop int n = 1 until n > rep
begin
  
	int cue = cue_type[n];
	int stim = tr_type[n];
		
	# Change cue
	cue_text.set_font_color(255, 255, 255);
	boxes_text.set_font_color(255,255,255);
	
	if cue == 0 then												
		#cue_text.set_caption("o");
		#cue_text.set_font_size(30);
		#cue_picture.set_part_y(2,173);
		boxes_picture.set_part_y(1,-135);
		boxes_text.set_font_size(30);
		boxes_text.set_caption("o");
				
	elseif cue == 1 then											
		#cue_text.set_caption("*");
		#cue_text.set_font_size(40);
		#cue_picture.set_part_y(2,158);
		boxes_picture.set_part_y(1,-150);
		boxes_text.set_font_size(40);
		boxes_text.set_caption("*");
				
	elseif cue == 2 then		  									
		#cue_text.set_caption("**");	
		#cue_text.set_font_size(40);
		#cue_picture.set_part_y(2,158);
		boxes_picture.set_part_y(1,-150);
		boxes_text.set_font_size(40);
		boxes_text.set_caption("**");
				
	elseif cue == 5 then	
		#cue_text.set_font_color(100, 100, 100);
		boxes_text.set_font_color(100, 100, 100);
	end;
	
	cue_text.redraw();
	Middle_line3.redraw();
	boxes_text.redraw();
	
	if cue <= 4 then
		
		# Set up the stop times
		if stim == 0 then
			stop_time = boxRiseTime + overshoot;
		elseif stim == 1 && cue == 1 then
			stop_time = 800 - SSD1;
			SSD = SSD1;
		elseif stim == 1 && cue == 2 then
			stop_time = 800 - SSD2;
			SSD = SSD2;
		elseif stim == 1 && cue == 3 then
			stop_time = 800 - SSD3;
			SSD = SSD3;
		elseif stim == 1 && cue == 4 then
			stop_time = 800 - SSD4;
			SSD = SSD4;
		end;
	
		# Variables to remember responses & onsets
		respOnset = 0;
		resp = 0;
		# Animate boxes
		
		animStartTime = clock.time();
		trialEndTime = animStartTime + boxRiseTime;		
		
		loop int iSample = 1 until 0 > 1 begin
			
			int t = clock.time() - animStartTime;
			
			# Report trial information at first sample.
			if (iSample == 1) then
				event0.set_event_code("bla");
			else
				event0.set_event_code("");
			end;
			
			# Increase box lengths while needed on this trial.
			if (t <= stop_time && respOnset == 0) then
				int h = 1 + int(double(maxLength) * double(t) / double(boxRiseTime));
				the_box.set_height(h);
				boxes_picture.set_part_y(5, -100 + h / 2);
			end;
			
			# Response management
					
			if (response_manager.response_count(1) == 1) then
				resp = 1;
				respOnset = clock.time() - animStartTime;
			end;
			
			# Time management
			if (clock.time() >= trialEndTime) then
				break;
			end;
			
			# Updates
			trial_sample.present();
			iSample = iSample + 1;
			
			corr_tr = corr_tr + 1;
			trialRT[n] = respOnset - 800;
		
		end;
	
		# Feedback
		
		int timing_error;
		
		if stim == 0 && resp == 0 then
			timing_error = 1000;
			acc = 0;
			boxes_text.set_font_color(255,0,0);
			boxes_text.set_caption("X");
			boxes_text.set_font_size(40);
			boxes_picture.set_part_y(1,-140);
			
		elseif stim == 0 && resp == 1 then
			timing_error = respOnset - 800;
			acc = 1;
			boxes_text.set_font_color(100,100,100);			# Don't show response latencies
			#feedback_text.set_font_color(255,255,255);
			#feedback_text.set_font_size(24);	
			#feedback_text.set_caption(string(timing_error));
		elseif stim == 1 && resp == 0 then
			acc = 1;
			boxes_text.set_font_color(100,100,100);	
			
			if cue == 1 then
				if SSD1 > SSDMin then
					SSD1 = SSD1 - SSDstep;
				else
					SSD1 = SSD1;
				end;
			elseif cue == 2 then
				if SSD2 > SSDMin then
					SSD2 = SSD2 - SSDstep;
				else
					SSD2 = SSD2;
				end;
			elseif cue == 3 then
				if SSD3 > SSDMin then
					SSD3 = SSD3 - SSDstep;
				else
					SSD3 = SSD3;
				end;
			elseif cue == 4 then
				if SSD4 > SSDMin then
					SSD4 = SSD4 - SSDstep;
				else
					SSD4 = SSD4;
				end;
			end;
			
		elseif stim == 1 && resp == 1 then
			timing_error = respOnset - 800;
			acc = 0;
			boxes_text.set_caption("X");
			boxes_text.set_font_color(255,0,0);
			
			if cue == 1 then
				if SSD1 < SSDMax then
					SSD1 = SSD1 + SSDstep;
				else
					SSD1 = SSD1;
				end;
			elseif cue == 2 then
				if SSD2< SSDMax then
					SSD2 = SSD2 + SSDstep;
				else
					SSD2 = SSD2;
				end;
			elseif cue == 3 then
				if SSD3 < SSDMax then
					SSD3 = SSD3 + SSDstep;
				else
					SSD3 = SSD3;
				end;
			elseif cue == 4 then
				if SSD4 < SSDMax then
					SSD4 = SSD4 + SSDstep;
				else
					SSD4 = SSD4;
				end;
			end;
	
		end;
	
		boxes_text.redraw();
		feedback_trial.present();
	
		outputfile.print(n); outputfile.print("\t");
		outputfile.print(animStartTime); outputfile.print("\t");
		outputfile.print(cue); outputfile.print("\t");
		outputfile.print(stim); outputfile.print("\t");
		outputfile.print(acc); outputfile.print("\t");
		if stim == 0 && resp == 0 then
		outputfile.print("\t");
		outputfile.print("\t");
		elseif stim == 0 && resp == 1 then
		outputfile.print(respOnset); outputfile.print("\t");
		outputfile.print("\t");
		elseif stim == 1 && resp == 0 then
		outputfile.print("\t");
		outputfile.print(SSD); outputfile.print("\t");
		elseif stim == 1 && resp == 1 then
		outputfile.print(respOnset); outputfile.print("\t");
		outputfile.print(SSD); outputfile.print("\t");
		end;
		outputfile.print("\n");
	
		
		trial_ITI.present();
		
	elseif cue == 5 then
		
		trial_null.present();
		
		outputfile.print(n); outputfile.print("\t");
		outputfile.print(animStartTime); outputfile.print("\t");
		outputfile.print(cue); outputfile.print("\t");
		outputfile.print("\t");
		outputfile.print("\t");
		outputfile.print("\t");
		outputfile.print("\t");
		outputfile.print("\n");
		
	end;
	
	n = n + 1;

end;
outputfile.print("\n");

# added March 2018: generate a main log file
string mainLogFileName;
mainLogFileName = date_time("yyyymmdd") + "_" + subjectcode + "_mainLog.txt";	
output_file mainoutputfile = new output_file;
mainoutputfile.open_append( mainLogFileName );
mainoutputfile.print(subjectcode + "\t");
mainoutputfile.print(date_time("yyyy-mm-dd hh:mm") + "\t"); 
mainoutputfile.print("inhibmri\n");

if task == "4" then
	goodbye_trial.present();
elseif task == "3" then
	final_goodbye_practice.present();
else
	goodbye_practice.present();
end;