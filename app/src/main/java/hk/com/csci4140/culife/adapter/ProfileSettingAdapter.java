package hk.com.csci4140.culife.adapter;

import android.media.Image;
import android.support.v7.widget.RecyclerView;
import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;

import com.cazaea.sweetalert.SweetAlertDialog;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import hk.com.csci4140.culife.R;
import hk.com.csci4140.culife.model.EditProfileOptionModel;
/**
 * Created by maoyuxuan(Michael Mao) on 06/05/2018.
 */

public class ProfileSettingAdapter extends RecyclerView.Adapter<ProfileSettingAdapter.ProfileSettingViewHolder> {

    private static final String TAG = "ProfileSettingAdapter";

    private ArrayList<String> settingList;
    private ArrayList<Integer> settingLogoList;
    private Context mContext;



    // 2 types of constructor
    public ProfileSettingAdapter(Context context){
        settingList = new ArrayList<>();
        settingLogoList = new ArrayList<>();
        mContext = context;
    }

    public ProfileSettingAdapter(Context context, ArrayList<String> settingList, ArrayList<Integer> settingLogoList){
        this.settingList = settingList;
        this.settingLogoList = settingLogoList;
        mContext = context;
    }



    // overwrite some necessary methods
    // what layout to use
    @Override
    public ProfileSettingAdapter.ProfileSettingViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_profile_setting, parent, false);
        final ProfileSettingAdapter.ProfileSettingViewHolder holder = new ProfileSettingAdapter.ProfileSettingViewHolder(view);
        return holder;
    }

    // how should we put data into the view
    @Override
    public void onBindViewHolder(ProfileSettingAdapter.ProfileSettingViewHolder holder, final int position) {
        holder.mContent.setText(settingList.get(position));
        holder.mLogo.setImageResource(settingLogoList.get(position));
    }

    // total number of the items
    @Override
    public int getItemCount() {
        return settingList.size();
    }

    // ???
    @Override
    public long getItemId(int position) {
        //return packingItems.get(position).getId();
        return position;
    }



    // define the custom view holder
    final static class ProfileSettingViewHolder extends RecyclerView.ViewHolder {
        @BindView(R.id.item_profile_setting_logo)
        ImageView mLogo;

        @BindView(R.id.item_profile_setting_content)
        TextView mContent;

        @BindView(R.id.item_profile_setting_button)
        Button mButton;

        ProfileSettingViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
        }
    }
}
